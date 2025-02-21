import { createRouter, createWebHistory } from 'vue-router'
import LoginView from '../views/LoginView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: LoginView,
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: () => import('../views/DashboardView.vue'),
      meta: { requiresAuth: true } 
    },
  ],
})

router.beforeEach((to, from, next) => {
  // Ellenőrzi, hogy az útvonal igényel-e autentikációt
  if (to.matched.some(record => record.meta.requiresAuth)) {
    try {
      const sessionData = sessionStorage.getItem("authToken"); 

      // Ha nincs authToken, akkor a felhasználót visszairányítjuk a login oldalra
      const isAuthenticated = sessionData !== null && sessionData !== ""; 
      if (!isAuthenticated) {
        next({ name: 'home' });
      } else {
        next(); 
      }
    } catch (error) {
      console.error('Hiba történt a session ellenőrzése közben:', error);
      next({ name: 'home' });
    }
  } else {
    next(); 
  }
});

export default router;