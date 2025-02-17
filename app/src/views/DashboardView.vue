<template>
  <body>
    <div class="min-h-screen bg-gray-100">
      <nav class="bg-gray-800 text-white py-6 px-1 md:px-6 lg:px-12 flex justify-between">
          <h1 class="text-2xl font-bold">Felhasználók Kezelése</h1>
          <Button intent="danger">Kijelentkezés</Button>
      </nav>
      
      <div class="px-1 md:px-6 lg:px-12 pt-8">
        <Search_form @search="handleSearch" />
        <div class="overflow-x-auto max-h-[550px] overflow-y-auto">
          <table class="shadow min-w-full">
            <thead>
              <tr class="bg-gray-200">
                <th class="cell w-2/8 text-left">Név</th>
                <th class="cell w-2/8 text-left">Email</th>
                <th class="cell w-3/8 text-left">Jogosultságok</th>
                <th class="cell w-1/8 text-left">Műveletek</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in paginatedItems" :key="user.id" class="rows bg-white">
                <td class="cell ">{{ user.name }}</td>
                <td class="cell ">{{ user.email }}</td>
                <td class="cell ">{{ user.permissions }}</td>
                <td class="cell ">
                  <Button @click="editUser(user)">Szerkesztés</Button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <Pagination :currentPage="currentPage" :totalPages="totalPages" @cp="onCp" />
      </div>
    </div>
  </body>
</template>


<script setup>
import { ref, computed, onMounted } from 'vue';
import axios from 'axios';
import Pagination from '@/components/pagination.vue';
import Search_form from '@/components/search_form.vue';
import Button from '@/components/button.vue';

onMounted(() => {
    fetchUsers();
});

const users = ref([]);
const searchTerm = ref('');

const handleSearch = (search) => {
    searchTerm.value = search;
    currentPage.value = 1;
};

const filteredUsers = computed(() => {
  return users.value.filter(user =>
    user.name.toLowerCase().includes(searchTerm.value.toLowerCase()) ||
    user.email.toLowerCase().includes(searchTerm.value.toLowerCase())
  );
});

const fetchUsers = async () => {
  try {
    const token = localStorage.getItem('authToken');
    const response = await axios.get('http://localhost:8680/user/list', {
      headers: { Authorization: token }
    });
    users.value = response.data;   
  } catch (error) {
    console.error('Hiba a felhasználók lekérésekor:', error);
  }
};

//pagination
const onCp = (cp) => {
    currentPage.value = cp;
}
const currentPage = ref(1);
const itemsPerPage = ref(15);

const totalPages = computed(() => {
  return Math.ceil(filteredUsers.value.length / itemsPerPage.value);
});

const paginatedItems = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return filteredUsers.value.slice(start, end);
});
</script>

<style scoped>
.rows {
  border-bottom: 1px solid lightgrey;
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.rows:hover {
  background-color: #f0f0f0; 
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
}

.cell {
  height: 55px;    
  vertical-align: middle;
  padding: 12px;
}

table {
  width: 100%;  
  min-width: 800px; 
}

</style>