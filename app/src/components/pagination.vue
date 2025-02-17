<template>
  <div v-if="totalPages > 1" class="pagination-wrapper">
    <div class="pagination">
      <!-- Előző gomb -->
      <Button
        intent="secondary"
        :disabled="currentPage === 1"
        @click="prevPage"
      >
        Előző
      </Button>

      <!-- Oldalszám -->
      <span class="pagination-info">{{ currentPage }}. lap a {{ totalPages }} lapból</span>

      <!-- Következő gomb -->
      <Button
        intent="secondary"
        :disabled="currentPage === totalPages"
        @click="nextPage"
      >
        Következő
      </Button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import Button from './button.vue';

// Props átadása
const props = defineProps({
  currentPage: {
    type: Number,
    required: true,
  },
  totalPages: {
    type: Number,
    required: true,
  },

});

const emit = defineEmits(["cp"]);

const cp = ref(props.currentPage)

const nextPage = () => {
  if (cp.value < props.totalPages) {
    cp.value += 1;
  }
  emit('cp', cp.value)
};

const prevPage = () => {
  if (cp.value > 1) {
    cp.value -= 1;
  }
  emit('cp', cp.value)
};

// Emitálás a szülő felé
</script>

<style>
.pagination-wrapper {
  position: sticky;
  bottom: 0;
  background-color: #fff;
  box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px;
  z-index: 5;
}

.pagination {
  display: flex;
  align-items: center;
  justify-content: center;
}

.pagination-info {
  margin: 0 15px;
  font-size: 1rem;
  color: #495057;
}
</style>