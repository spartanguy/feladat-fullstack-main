<template>
  <Teleport to="body">
    <div v-if="isOpen" class="fixed inset-0 flex items-center justify-center z-50">
      <div class="absolute inset-0" style="background: rgba(0, 0, 0, 0.5);"></div>
      <div class=" w-[100%] md:w-[60%] max-w-3xl p-2 md:p-6 bg-white shadow-lg rounded-lg flex flex-col relative z-10">     
        <h2 class="text-xl font-bold mb-4 text-center">Új Felhasználó</h2>
        <div class="flex gap-6">
          <div class="flex-1">
            <h3 class="text-lg font-semibold my-4">Adatok</h3>
            <div class="mb-3">
              <label class="block text-sm font-medium">Név</label>
              <input v-model="user.name" type="text" placeholder="Teszt Elek" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2"/>
            </div>
            <div class="mb-3">
              <label class="block text-sm font-medium">Email</label>
              <input v-model="user.email" type="email" placeholder="example@example.com" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2" />
            </div>
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
              <label class="flex items-center space-x-2">
                <input type="checkbox" v-model="permissions.root" />
                <span>Minden jog</span>
              </label>
              <label class="flex items-center space-x-2 ml-4">
                <input type="checkbox" v-model="permissions.user" />
                <span>Felhasználók</span>
              </label>
              <label class="flex items-center space-x-2 ml-8">
                <input type="checkbox" v-model="permissions.read" />
                <span>Felhasználók olvasása</span>
              </label>
              <label class="flex items-center space-x-2 ml-8">
                <input type="checkbox" v-model="permissions.write" />
                <span>Felhasználók írása</span>
              </label>
            </div>
          </div>
        </div>
        <div class="mt-4 flex justify-center gap-6">
          <Button @click="closeModal" intent="danger" >Bezárás</Button>
          <Button @click="onSave" intent="secondary" >Mentés</Button>
        </div>
      </div>
    </div>
  </Teleport>
</template>

<script setup>
import { reactive } from 'vue';
import Button from './button.vue';
import { createUser } from '@/services/api';

const user = reactive({
  name: '',
  email: '',
  password: '',
  confirmPassword: '',
});

const permissions = reactive({
  root: false,
  user: false,
  read: false,
  write: false,
});

defineProps({
  isOpen: Boolean,
  title: String,
});

const emit = defineEmits(["close"]);

const closeModal = () => {
  emit("close");
};

const onSave = () => {
  createUser(user.name,user.password,user.email,localStorage.getItem('authToken'));
  closeModal();
};
</script>