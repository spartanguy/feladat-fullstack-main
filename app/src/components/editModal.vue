<template>
  <Teleport to="body">
    <div v-if="isOpen" class="fixed inset-0 flex items-center justify-center z-50">
      <div class="absolute inset-0" style="background: rgba(0, 0, 0, 0.5);"></div>
      <div class=" w-[100%] md:w-[60%] max-w-3xl p-2 md:p-6 bg-white shadow-lg rounded-lg flex flex-col relative z-10">     
        <h2 class="text-xl font-bold mb-4 text-center">Felhasználó Adatai</h2>
        <div class="flex gap-6">
          <div class="flex-1">
            <h3 class="text-lg font-semibold my-4">Adatok</h3>
            <div class="mb-3">
              <SelectSwitch :is-active="!user.deleted" @change="changeDeleted"/>
            </div>
            <div class="mb-3">
              <label class="block text-sm font-medium">Név</label>
              <input v-model="user.name" type="text" placeholder="Teszt Elek" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2"/>
            </div>
            <div class="mb-3">
              <label class="block text-sm font-medium">Email</label>
              <input v-model="user.email" type="email" placeholder="example@example.com" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2" />
            </div>
            <h3 class="text-lg font-semibold my-4">Új Jelszó</h3>
            <div class="mb-3">
              <label class="block text-sm font-medium">Jelszó</label>
              <input v-model="user.password" type="password" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2" />
            </div>
            <div class="mb-3">
              <label class="block text-sm font-medium">Jelszó újra</label>
              <input v-model="user.confirmPassword" type="password" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2" />
            </div>
          </div>
          <div class="md:w-1/3 md:border-l border-gray-300 md:pl-6 max-h-60 md:max-h-full overflow-y-auto">
            <h3 class="text-lg font-semibold mt-4">Jogok</h3>
            <div class="mt-2">
              <button @click="pRoot = !pRoot" class="flex items-center gap-1">
                <span class="w-3.5 h-3.5 pb-1 pl-0.4 flex items-center justify-center border border-gray-500 rounded">
                  {{ pRoot ? '-' : '+' }}
                </span>
                <span>Minden jog</span>
              </button>
              <button v-if="pRoot" @click="pUser = !pUser" class="flex items-center gap-1 ml-4">
                <span class="w-3.5 h-3.5 pb-1 pl-0.4 flex items-center justify-center border border-gray-500 rounded">
                  {{ pUser ? '-' : '+' }}
                </span>
                <span>Felhasználók</span>
              </button>
              <label v-if="pRoot && pUser" class="flex items-center space-x-2 ml-8">
                <input type="checkbox" v-model="user.permissions.read" />
                <span>Felhasználók olvasása</span>
              </label>
              <label v-if="pRoot && pUser" class="flex items-center space-x-2 ml-8">
                <input type="checkbox" v-model="user.permissions.write" />
                <span>Felhasználók írása</span>
              </label>
            </div>
          </div>
        </div>
        <div class="mt-4 flex justify-center gap-6">
          <Button @click="closeModal" intent="danger" >Bezárás</Button>
          <Button @click="onSave" intent="secondary" >Mentés</Button>
          <Button @click="delUser" intent="danger" >Törlés</Button>
        </div>
      </div>
    </div>
  </Teleport>
</template>

<script setup>
import { reactive, watch, ref } from 'vue';
import Button from './button.vue';
import SelectSwitch from './selectSwitch.vue';
import { deleteUser, editUser } from '@/services/api';

const props = defineProps({
  isOpen: Boolean,
  data: Object,
});

const user = reactive({
  name: '',
  email: '',
  deleted: false,
  password: '',
  confirmPassword: '',
  permissions: {
    read: false,
    write: false,
  }
});

const pRoot = ref(true);
const pUser = ref(true);

watch(() => props.data, (newData) => {
  if (newData) {
    user.name = newData.name || '';
    user.email = newData.email || '';
    user.deleted = newData.deleted || false;
    user.password = '';
    user.confirmPassword = '';
    user.permissions.read = newData.permissions.includes('user.read') || false,
    user.permissions.write = newData.permissions.includes('user.write') || false
  }
}, { immediate: true });

const emit = defineEmits(["close"]);

const closeModal = () => {
  pRoot.value = true;
  pUser.value = true;
  emit("close");
};

const onSave = () => {
  let permPack = [];
  if (user.permissions.read == true) {
    permPack.push('user.read')
  }
  if (user.permissions.write == true) {
    permPack.push('user.write')
  }
  console.log(permPack);
  
  editUser(props.data.user_id, user.name, user.password, user.email, permPack, localStorage.getItem('authToken'));
  if (user.deleted == true) {
    delUser();
  }
}

const delUser = () => {
  deleteUser(props.data.user_id, localStorage.getItem('authToken'));
  closeModal();
}
const changeDeleted = (newValue) => {
  user.deleted = !newValue; 
};
</script>