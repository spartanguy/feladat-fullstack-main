<template>
  <div class="h-screen flex flex-col md:flex-row bg-gradient-to-r from-blue-200 to-purple-300">
    <!-- Bal oldal -->
    <div class="w-full h-1/2 md:h-full md:w-1/2 flex flex-col justify-center bg-gradient-to-r from-purple-600 to-pink-500 text-white p-5">
      <h1 class="fancy text-6xl md:text-6xl lg:text-8xl max-w-lg mx-auto md:mx-0">Üdvözöljük!</h1>
      <p class="mt-5 md:mt-9 text-lg max-w-lg mx-auto md:mx-0">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu fermentum nisi.
      </p>
    </div>

    <!-- Jobb oldal -->
    <div class="w-full md:w-1/2 flex flex-col justify-center items-center">
      <h2 class="pt-5 fancy text-7xl text-purple-800 mb-8">uniadmin</h2>

      <div v-if="errorMessage" class="text-red-600 text-lg mb-4 font-semibold">
        {{ errorMessage }}
      </div>

      <div class="w-full space-y-4 justify-items-center">
        <div class="relative w-70">
          <input v-model="name" type="text" placeholder="Felhasználónév"
                 class="bg-white w-full py-2 pl-10 pr-4 text-lg rounded-full focus:outline-none focus:ring-2 focus:ring-purple-500">
          <span class="absolute left-3 top-3 text-gray-400">
            <UserIcon/>
          </span>
        </div>

        <div class="relative w-70">
          <input v-model="pass" type="password" placeholder="Jelszó"
                 class="bg-white w-full py-2 pl-10 pr-4 text-lg rounded-full focus:outline-none focus:ring-2 focus:ring-purple-500">
          <span class="absolute left-3 top-3 text-gray-400">
            <KeyIcon/>
          </span>
        </div>

        <button @click="onLogin" class="p-13 bg-purple-800 text-white py-3 rounded-full shadow-lg hover:bg-purple-900 transition font-bold">
          Bejelentkezés
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import KeyIcon from '@/components/icons/KeyIcon.vue';
import UserIcon from '@/components/icons/UserIcon.vue';
import { useRouter } from 'vue-router';
import { login } from '@/services/api';
import { ref } from 'vue';

const name = ref('');
const pass = ref('');
const errorMessage = ref('');
const router = useRouter();

const onLogin = async () => {
  errorMessage.value = ''; 

  try {
    const response = await login(name.value, pass.value);
    localStorage.setItem("authToken", response.token);
    router.push("/dashboard");
  } catch (error) {
    errorMessage.value = "Hibás felhasználónév vagy jelszó!", error;
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

.fancy {
  font-family: 'Pacifico', cursive;
}
</style>
