<template>
  <div>
    <!-- Fő jogosultságcsoport kibontása / összecsukása -->
    <button @click="pRoot = !pRoot" class="flex items-center gap-1">
      <span class="w-3.5 h-3.5 pb-1 pl-0.4 flex items-center justify-center border border-gray-500 rounded">
        {{ pRoot ? '-' : '+' }}
      </span>
      <span>Minden jog</span>
    </button>

    <!-- "Felhasználók" jogosultságcsoport -->
    <button v-if="pRoot" @click="pUser = !pUser" class="flex items-center gap-1 ml-4">
      <span class="w-3.5 h-3.5 pb-1 pl-0.4 flex items-center justify-center border border-gray-500 rounded">
        {{ pUser ? '-' : '+' }}
      </span>
      <span>Felhasználók</span>
    </button>

    <!-- Jogosultság beállítások -->
    <label v-if="pRoot && pUser" class="flex items-center ml-8">
      <input :disabled="!canWrite" type="checkbox"  v-model="permissionModel.read"/>
      <span>Felhasználók olvasása</span>
    </label>
    <label v-if="pRoot && pUser" class="flex items-center ml-8">
      <input :disabled="!canWrite" type="checkbox" v-model="permissionModel.write"/>
      <span>Felhasználók írása</span>
    </label>
  </div>
</template>

<script setup>
import { ref, defineProps, computed } from 'vue';

const props = defineProps({ 
  permissions: Object 
});

const emit = defineEmits(['update:permissions'])
// Jogosultságok állapota a sessionStorage alapján
const canWrite = sessionStorage.getItem('permissions').includes('user.write');

// Reaktív jogosultságmodell (kétirányú adatkapcsolattal)
const permissionModel = computed({
  get: () => props.permissions,
  set: (newval) => emit('update:permissions', newval)
})

// UI állapotok (hierarchia kibontása/összecsukása)
const pRoot = ref(true);
const pUser = ref(true);
</script>