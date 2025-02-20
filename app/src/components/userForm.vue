<template>
  <form class="flex" @submit.prevent="handleSubmit">
    <div class="flex-1 mr-4">
      <h3 class="text-lg font-semibold my-4">Adatok</h3>
      <div class="mb-3">
        <label class="block text-sm font-medium">Név</label>
        <div v-if="errors" class="error"> {{ errors.name }} </div>
        <input :disabled="!canWrite" v-model="userModel.name" type="text" placeholder="Teszt Elek" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2"/>
      </div>
      <div class="mb-3">
        <label class="block text-sm font-medium">Email</label>
        <div v-if="errors" class="error"> {{ errors.email }} </div>
        <input :disabled="!canWrite" v-model="userModel.email" type="email" placeholder="example@example.com" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2" />
      </div>
      <h3 v-if="showNewPass && canWrite" class="text-lg font-semibold my-4">Új Jelszó</h3>
      <div v-if="canWrite" class="mb-3">
        <label class="block text-sm font-medium">Jelszó</label>
        <div v-if="errors" class="error"> {{ errors.password }} </div>
        <input v-model="userModel.password" type="password" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2" />
      </div>
      <div v-if="canWrite" class="mb-3">
        <label class="block text-sm font-medium">Jelszó újra</label>
        <div v-if="errors" class="error"> {{ errors.confirmPassword }} </div>
        <input v-model="userModel.confirmPassword" type="password" class="w-full rounded-md p-2 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2" />
      </div>
    </div>
    <div class="md:w-1/3 md:border-l border-gray-300 md:pl-6 max-h-60 md:max-h-full overflow-y-auto">
      <h3 class="text-lg font-semibold mt-4">Jogok</h3>
      <PermissionTree v-model:permissions="userModel.permissions" />
    </div>
  </form>
</template>
  
<script setup>
import { computed } from 'vue';
import PermissionTree from './permissionTree.vue';

const props = defineProps({
  user: Object,
  errors: Object,
  showNewPass: {type: Boolean, default: false}
});
const emit = defineEmits(['update:user']);
const canWrite = localStorage.getItem('permissions').includes('user.write')

const userModel = computed({
  get: () => props.user,
  set: (newValue) => emit('update:user', newValue)
});
</script>

<style scoped>

.error {
  color: red;
  font-size: 0.875rem;
  margin-top: 5px;
  margin-bottom: 5px;
}
</style>
  