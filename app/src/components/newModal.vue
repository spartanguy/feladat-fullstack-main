<template>
  <BaseModal :isOpen="isOpen" title="Új Felhasználó" @close="$emit('close')" @save="onSave">
    <UserForm v-model:user="user" :errors="errors" />
  </BaseModal>
</template>

<script setup>
import { reactive, ref } from "vue";
import BaseModal from "./baseModal.vue";
import UserForm from "./userForm.vue";
import { createUser } from "@/services/api";
import { validateNewUserForm } from "@/utils/formValidation";

defineProps({ isOpen: Boolean });
const emit = defineEmits(["close"]);

const errors = ref(null);

const user = reactive({ name: "", email: "", password: "", confirmPassword: "", permissions: { read: false, write: false } });
const onSave = async () => {
  const permissionsArray = [];
  if (user.permissions.read) permissionsArray.push('user.read');
  if (user.permissions.write) permissionsArray.push('user.write');
  const payload = {
    ...user,
    permissions: permissionsArray
  };
  errors.value = validateNewUserForm(payload);
  
  if (Object.keys(errors.value).length) return;
  await createUser(payload.name,payload.password,payload.email,payload.permissions, localStorage.getItem('authToken'));
  emit("close");
};
</script>