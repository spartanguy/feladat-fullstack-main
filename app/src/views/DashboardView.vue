<template>
  <div class="min-h-screen bg-gray-100">
    <nav class="bg-gray-800 text-white py-6 px-1 md:px-6 lg:px-12 flex justify-between">
      <h1 class="text-2xl font-bold">Felhasználók és Assetek Kezelése</h1>
      <Button @click="onLogout" intent="danger">Kijelentkezés</Button>
    </nav>

    <NewModal :isOpen="newOpen" @close="handleNewClose" />
    <EditModal :data="currentUser" :isOpen="editOpen" @close="handleEditClose" />

    <div class="px-1 md:px-6 lg:px-12 pt-8 space-y-8">
      <section>
        <h2 class="text-xl font-semibold mb-3">Felhasználók</h2>
        <div class="flex justify-between">
          <Search_form v-if="canRead" class="w-5/8" @search="handleSearch" />
          <div class="ml-2 my-auto">
            <Button v-if="canWrite" @click="newOpen = true" intent="secondary">+ Új Felhasználó</Button>
          </div>
        </div>

        <div v-if="canRead" class="overflow-x-auto max-h-[550px] overflow-y-auto" :style="{ maxHeight: screenHeight + 'px' }">
          <table class="shadow min-w-full">
            <thead class="sticky top-0">
              <tr class="bg-gray-200">
                <th class="cell w-2/8 text-left">Név</th>
                <th class="cell w-2/8 text-left">Email</th>
                <th class="cell w-3/8 text-left">Jogosultságok</th>
                <th class="cell w-1/8 text-left">Műveletek</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in paginatedItems" :key="user.id" class="rows bg-white">
                <td class="cell">{{ user.name }}</td>
                <td class="cell">{{ user.email }}</td>
                <td class="cell">{{ user.permissions }}</td>
                <td class="cell">
                  <Button @click="editUser(user.id)">Szerkesztés</Button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <Pagination v-if="canRead" v-model:currentPage="currentPage" :totalPages="totalPages" />
        <div v-else>Nincs joga a felhasználók megtekintésére</div>
      </section>

      <section>
        <h2 class="text-xl font-semibold mb-3">Assetek</h2>

        <div v-if="canAssetWrite" class="bg-white rounded-lg shadow p-4 mb-4 grid gap-3 md:grid-cols-4">
          <input v-model="newAsset.name" type="text" placeholder="Asset név" class="rounded-md p-2 ring-1 ring-inset ring-gray-300" />
          <input v-model="newAsset.description" type="text" placeholder="Leírás" class="rounded-md p-2 ring-1 ring-inset ring-gray-300" />
          <input v-model="newAsset.expiresAt" type="date" class="rounded-md p-2 ring-1 ring-inset ring-gray-300" />
          <Button intent="secondary" @click="onCreateAsset">+ Új Asset</Button>
        </div>

        <div v-if="canAssetRead" class="overflow-x-auto">
          <table class="shadow min-w-full bg-white">
            <thead>
              <tr class="bg-gray-200">
                <th class="cell text-left">Név</th>
                <th class="cell text-left">Leírás</th>
                <th class="cell text-left">Lejárat</th>
                <th class="cell text-left">Hozzárendelt userek</th>
                <th v-if="canAssetWrite" class="cell text-left">Műveletek</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="asset in assets" :key="asset.id" class="rows">
                <td class="cell">{{ asset.name }}</td>
                <td class="cell">{{ asset.description }}</td>
                <td class="cell">{{ asset.expires_at }}</td>
                <td class="cell">{{ asset.user_names?.join(', ') || 'Nincs hozzárendelés' }}</td>
                <td v-if="canAssetWrite" class="cell">
                  <div class="flex flex-col gap-2">
                    <div class="flex gap-2">
                      <select v-model="selectedAssignments[asset.id]" class="rounded-md p-2 ring-1 ring-inset ring-gray-300">
                        <option :value="null">User kiválasztása</option>
                        <option v-for="user in users" :key="`assign-${asset.id}-${user.id}`" :value="user.id">
                          {{ user.name }}
                        </option>
                      </select>
                      <Button intent="secondary" @click="onAssignAsset(asset.id)">Hozzárendelés</Button>
                    </div>
                    <div class="flex gap-2">
                      <select v-model="selectedUnassignments[asset.id]" class="rounded-md p-2 ring-1 ring-inset ring-gray-300">
                        <option :value="null">Hozzárendelés törlése</option>
                        <option v-for="userId in asset.user_ids" :key="`unassign-${asset.id}-${userId}`" :value="Number(userId)">
                          {{ userNameById(Number(userId)) }}
                        </option>
                      </select>
                      <Button intent="danger" @click="onUnassignAsset(asset.id)">Leválasztás</Button>
                      <Button intent="danger" @click="onDeleteAsset(asset.id)">Asset törlése</Button>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-else>Nincs joga az assetek megtekintésére</div>
      </section>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, onUnmounted, reactive, ref } from 'vue';
import Pagination from '@/components/pagination.vue';
import Search_form from '@/components/search_form.vue';
import Button from '@/components/button.vue';
import NewModal from '@/components/newModal.vue';
import EditModal from '@/components/editModal.vue';
import {
  assignAsset,
  createAsset,
  deleteAsset,
  fetchAssets,
  fetchUsers,
  logout,
  readUser,
  unassignAsset,
} from '@/services/api';
import router from '@/router';

const users = ref([]);
const assets = ref([]);
const searchTerm = ref('');
const screenHeight = ref(window.innerHeight - 240);
const canRead = sessionStorage.getItem('permissions').includes('user.read');
const canWrite = sessionStorage.getItem('permissions').includes('user.write');
const canAssetRead = sessionStorage.getItem('permissions').includes('asset.read');
const canAssetWrite = sessionStorage.getItem('permissions').includes('asset.write');

const selectedAssignments = reactive({});
const selectedUnassignments = reactive({});
const newAsset = reactive({ name: '', description: '', expiresAt: '' });

onMounted(async () => {
  if (canRead || canAssetWrite) await fetchUsersList();
  if (canAssetRead) await fetchAssetsList();
  window.addEventListener('resize', updateScreenSize);
});

onUnmounted(() => {
  window.removeEventListener('resize', updateScreenSize);
});

const fetchUsersList = async () => {
  try {
    users.value = await fetchUsers(sessionStorage.getItem('authToken'));
  } catch (error) {
    console.error('Hiba történt a felhasználók frissítésekor:', error);
  }
};

const fetchAssetsList = async () => {
  try {
    assets.value = await fetchAssets(sessionStorage.getItem('authToken'));
  } catch (error) {
    console.error('Hiba történt az assetek frissítésekor:', error);
  }
};

const onCreateAsset = async () => {
  if (!newAsset.name || !newAsset.description || !newAsset.expiresAt) return;
  await createAsset(newAsset.name, newAsset.description, newAsset.expiresAt, sessionStorage.getItem('authToken'));
  newAsset.name = '';
  newAsset.description = '';
  newAsset.expiresAt = '';
  fetchAssetsList();
};

const onDeleteAsset = async (assetId) => {
  await deleteAsset(assetId, sessionStorage.getItem('authToken'));
  fetchAssetsList();
};

const onAssignAsset = async (assetId) => {
  const userId = selectedAssignments[assetId];
  if (!userId) return;
  await assignAsset(assetId, Number(userId), sessionStorage.getItem('authToken'));
  selectedAssignments[assetId] = null;
  fetchAssetsList();
};

const onUnassignAsset = async (assetId) => {
  const userId = selectedUnassignments[assetId];
  if (!userId) return;
  await unassignAsset(assetId, Number(userId), sessionStorage.getItem('authToken'));
  selectedUnassignments[assetId] = null;
  fetchAssetsList();
};

const userNameById = (id) => users.value.find((user) => Number(user.id) === Number(id))?.name || `#${id}`;

const updateScreenSize = () => {
  screenHeight.value = window.innerHeight - 240;
};

const handleSearch = (search) => {
  searchTerm.value = search;
  currentPage.value = 1;
};

const filteredUsers = computed(() => users.value.filter((user) =>
  user.name.toLowerCase().includes(searchTerm.value.toLowerCase())
  || user.email.toLowerCase().includes(searchTerm.value.toLowerCase()),
));

const handleNewClose = () => {
  newOpen.value = false;
  setTimeout(fetchUsersList, 100);
};

const handleEditClose = () => {
  editOpen.value = false;
  setTimeout(fetchUsersList, 100);
};

const currentPage = ref(1);
const itemsPerPage = ref(15);

const totalPages = computed(() => Math.ceil(filteredUsers.value.length / itemsPerPage.value));

const paginatedItems = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return filteredUsers.value.slice(start, end);
});

const editOpen = ref(false);
const newOpen = ref(false);
const currentUser = ref(undefined);

const editUser = async (currUser) => {
  currentUser.value = await readUser(currUser, sessionStorage.getItem('authToken'));
  editOpen.value = true;
};

const onLogout = () => {
  logout(sessionStorage.getItem('authToken'));
  router.push('/');
};
</script>

<style scoped>
table {
  width: 100%;
  min-width: 800px;
}
</style>
