<template>
  <body>
    <div class="min-h-screen bg-gray-100">
      <nav class="bg-gray-800 text-white py-6 px-1 md:px-6 lg:px-12 flex justify-between">
          <h1 class="text-2xl font-bold">Felhasználók Kezelése</h1>
          <Button @click="onLogout" intent="danger">Kijelentkezés</Button>
      </nav>
      <NewModal :isOpen="newOpen" @close="handleNewClose"/>
      <EditModal :data="currentUser" :isOpen="editOpen" @close="handleEditClose"/>
      <div class="px-1 md:px-6 lg:px-12 pt-8">
        <div class="flex justify-between">
          <Search_form v-if="canRead" class="w-5/8" @search="handleSearch"/>
          <div class="ml-2 my-auto">
            <Button v-if="canWrite" @click="newOpen = true" intent="secondary">+ Új Felhasználó</Button>
          </div>
        </div>
        <div v-if="canRead" class="overflow-x-auto max-h-[550px] overflow-y-auto" :style="{ maxHeight: screenHeight + 'px'}">
          <table class="shadow min-w-full">
            <thead>
              <tr class="bg-gray-200">
                <th class="cell w-2/8 text-left">Név</th>
                <th class="cell w-2/8 text-left">Email</th>
                <th class="cell w-3/8 text-left">Jogosultságok</th>
                <th class="cell w-1/8 text-left">Műveletek</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in paginatedItems" :key="user.id" class="rows bg-white">
                <td class="cell ">{{ user.name }}</td>
                <td class="cell ">{{ user.email }}</td>
                <td class="cell ">{{ user.permissions }}</td>
                <td class="cell ">
                  <Button @click="editUser(user.id)">Szerkesztés</Button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <Pagination v-if="canRead" :currentPage="currentPage" :totalPages="totalPages" @cp="onCp" />
        <div v-else>Nincs joga a felhasználók megtekintésére</div>
      </div>
    </div>
  </body>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted} from 'vue';
import Pagination from '@/components/pagination.vue';
import Search_form from '@/components/search_form.vue';
import Button from '@/components/button.vue';
import NewModal from '@/components/newModal.vue';
import EditModal from '@/components/editModal.vue';
import { fetchUsers, logout, readUser } from '@/services/api';
import router from '@/router';

onMounted(async () => {
    fetchUsersList();  
    window.addEventListener('resize', updateScreenSize);
});

onUnmounted(() => {
  window.removeEventListener('resize', updateScreenSize);
});

const fetchUsersList = async () => {
  try {
    users.value = await fetchUsers(localStorage.getItem('authToken'));
  } catch (error) {
    console.error("Hiba történt a felhasználók frissítésekor:", error);
  }
};

const updateScreenSize = () => {
  screenHeight.value = window.innerHeight-240;
};

const users = ref([]);
const canRead = localStorage.getItem('permissions').includes('user.read');
const canWrite = localStorage.getItem('permissions').includes('user.write');
const searchTerm = ref('');
const screenHeight = ref(window.innerHeight-240);

const handleSearch = (search) => {
    searchTerm.value = search;
    currentPage.value = 1;
};

const filteredUsers = computed(() => {
  return users.value.filter(user =>
    user.name.toLowerCase().includes(searchTerm.value.toLowerCase()) ||
    user.email.toLowerCase().includes(searchTerm.value.toLowerCase())
  );
});

const handleNewClose = () => {
  newOpen.value = false;
  setTimeout(fetchUsersList, 100); 
};

const handleEditClose = () => {
  editOpen.value = false;
  setTimeout(fetchUsersList, 100);
};

//pagination
const onCp = (cp) => {
    currentPage.value = cp;
}
const currentPage = ref(1);
const itemsPerPage = ref(15);

const totalPages = computed(() => {
  return Math.ceil(filteredUsers.value.length / itemsPerPage.value);
});

const paginatedItems = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return filteredUsers.value.slice(start, end);
});

//modals
const editOpen = ref(false);
const newOpen = ref(false);
const currentUser = ref(undefined);

const editUser = async (currUser) => {
  currentUser.value = await readUser(currUser, localStorage.getItem('authToken'));
  editOpen.value = true;
}

const onLogout = () => {
  logout(localStorage.getItem('authToken'));
  router.push("/");
}
</script>
<style scoped>
table {
  width: 100%;  
  min-width: 800px; 
}
</style>