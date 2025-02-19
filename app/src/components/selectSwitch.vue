<template>
  <div class="flex items-center">
    <button
      @click="toggleState"
      :class="[
        'relative w-10 h-6 rounded-full transition-colors duration-300 focus:outline-none',
        localActive ? 'bg-green-500' : 'bg-red-500'
      ]"
    >
      <span
        :class="[
          'absolute w-4 h-4 rounded-full transition-transform duration-300 bg-white top-1 left-0.5',
          localActive ? 'translate-x-5' : 'translate-x-0'
        ]"
      ></span>
    </button>
    <span class="ml-2 text-gray-600">Aktív</span>
  </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({ isActive: Boolean });
const emit = defineEmits(['change']);

const localActive = computed({
  get: () => props.isActive,
  set: (value) => emit('change', value)
});

const toggleState = () => {
  localActive.value = !localActive.value;
};
</script>