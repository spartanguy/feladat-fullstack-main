<template>
  <BaseModal :isOpen="isOpen" title="Felhasználó Szerkesztése" @close="$emit('close')" @save="onSave">
    <UserForm v-model:user="user" :errors="errors" :showNewPass="true"/>
  </BaseModal>
</template>

<script setup>
import { reactive, ref, watch } from "vue";
import BaseModal from "./baseModal.vue";
import UserForm from "./userForm.vue";
import { editUser } from "@/services/api";
import { validateEditForm } from "@/utils/formValidation";

const props = defineProps({ isOpen: Boolean, data: Object });
const emit = defineEmits(["close"]);
const user = reactive({ name: "", email: "", password: "", confirmPassword: "", permissions: { read: false, write: false } }); 
const errors = ref(null);

watch(() => props.data, (newData) => {
  if (newData) {
    const permissionsObject = { read: false, write: false };
    if (Array.isArray(newData.permissions)) {
      permissionsObject.read = newData.permissions.includes('user.read');
      permissionsObject.write = newData.permissions.includes('user.write');
    }
    Object.assign(user, newData, { permissions: permissionsObject });
  }
}, { immediate: true });


const onSave = () => {
  const permissionsArray = [];
  if (user.permissions.read) permissionsArray.push('user.read');
  if (user.permissions.write) permissionsArray.push('user.write');
  const payload = {
    ...user,
    permissions: permissionsArray
  };
  errors.value = validateEditForm(payload);
  
  if (Object.keys(errors.value).length) return;
    console.log("lessgo");
  
  editUser(props.data.user_id,payload.name,payload.password,payload.email,payload.permissions,localStorage.getItem('authToken'));
  emit("close");
};
</script>