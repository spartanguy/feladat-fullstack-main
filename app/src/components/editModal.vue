<template>
  <BaseModal :showDelete="true" :isOpen="isOpen" title="Felhasználó Szerkesztése" @close="onClose" @save="onSave" @delete="onDelete">
    <UserForm v-model:user="user" :errors="errors" :showNewPass="true"/>
  </BaseModal>
</template>

<script setup>
import { reactive, ref, watch } from "vue";
import BaseModal from "./baseModal.vue";
import UserForm from "./userForm.vue";
import { editUser, deleteUser } from "@/services/api";
import { validateEditForm } from "@/utils/formValidation";

const props = defineProps({ isOpen: Boolean, data: Object });
const emit = defineEmits(["close","update"]);
// Felhasználói objektum (reaktív, hogy módosítások érzékelhetők legyenek)
const user = reactive({ name: "", email: "", password: "", confirmPassword: "", permissions: { read: false, write: false } }); 
const errors = ref(null);

// Ha a `data` prop megváltozik, frissítjük a `user` objektumot
watch(() => props.data, (newData) => {
  if (newData) {
    const permissionsObject = { read: false, write: false };
    // Ellenőrizzük, hogy a permissions tömbként érkezik-e
    if (Array.isArray(newData.permissions)) {
      permissionsObject.read = newData.permissions.includes('user.read');
      permissionsObject.write = newData.permissions.includes('user.write');
    }
    // Az új adatokat hozzárendeljük a meglévő `user` objektumhoz
    Object.assign(user, newData, { permissions: permissionsObject });
  }
}, { immediate: true });


const onSave = async () => {
  // Jogosultságokat visszaalakítjuk tömbbé
  const permissionsArray = [];
  if (user.permissions.read) permissionsArray.push('user.read');
  if (user.permissions.write) permissionsArray.push('user.write');
  const payload = {
    ...user,
    permissions: permissionsArray
  };
  // Validáció
  errors.value = validateEditForm(payload);
  if (Object.keys(errors.value).length) return;
  await editUser(props.data.user_id,payload.name,payload.password,payload.email,payload.permissions,sessionStorage.getItem('authToken'));
  user.password = "";
  user.confirmPassword ="";
  emit("close");
};

const onDelete = async () => {
  // Felhasználó törlése API hívással
  await deleteUser(props.data.user_id, sessionStorage.getItem('authToken'));
  user.password = "";
  user.confirmPassword ="";
  emit("close");
}

const onClose = () => {
  user.password = "";
  user.confirmPassword ="";
  emit("close");
}
</script>