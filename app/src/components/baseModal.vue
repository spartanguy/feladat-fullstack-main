<template>
  <Teleport to="body">
    <div v-if="isOpen" class="fixed inset-0 flex items-center justify-center z-50">
      <div class="absolute inset-0 bg-black opacity-50"></div>
      <div class="w-full md:w-[60%] max-w-3xl p-6 bg-white shadow-lg rounded-lg flex flex-col relative z-10">
        <h2 class="text-xl font-bold mb-4 text-center">{{ title }}</h2>
        <slot></slot>
        <div class="mt-4 flex justify-center gap-6">
          <Button @click="emit('close')" intent="danger">Bezárás</Button>
          <Button v-if="canWrite" @click="emit('save')" intent="secondary">Mentés</Button>
          <Button v-if="showDelete && canWrite" @click="emit('delete')" intent="danger">Törlés</Button>
        </div>
      </div>
    </div>
  </Teleport>
</template>
  
<script setup>
import Button from "./button.vue";
// Ellenőrizzük, hogy a felhasználónak van-e írási jogosultsága
const canWrite = sessionStorage.getItem("permissions")?.includes("user.write") || false;
defineProps({ isOpen: Boolean, title: String, showDelete: Boolean });
const emit = defineEmits(["close", "save", "delete"]);
</script>