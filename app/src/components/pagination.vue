<template>
  <!-- Csak akkor jelenik meg, ha több mint 1 oldal van -->
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

      <!-- Oldalszám információ -->
      <span class="pagination-info">
        {{ currentPage }}. lap a {{ totalPages }} lapból
      </span>

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

const emit = defineEmits(["update:currentPage"]); 

// Lapozás előre
const nextPage = () => {
  if (props.currentPage < props.totalPages) {
    emit("update:currentPage", props.currentPage + 1); // V-model szerű frissítés
  }
};

// Lapozás vissza
const prevPage = () => {
  if (props.currentPage > 1) {
    emit("update:currentPage", props.currentPage - 1);
  }
};
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