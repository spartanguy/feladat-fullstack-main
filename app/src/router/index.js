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
    },
  ],
})

/*router.beforeEach( async (to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    try {
      const sessionData = await getSessionData(); 
      const isAuthenticated = sessionData && sessionData.userId !== undefined; 
      if (!isAuthenticated) {
        next({ name: 'Login' });
      } else {
        next(); 
      }
    } catch (error) {
      console.error('Hiba történt a session ellenőrzése közben:', error);
      next({ name: 'Login' }); 
    }
  } else {
    next(); 
  }
});*/

export default router
