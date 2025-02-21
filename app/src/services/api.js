import axios from 'axios';

// Axios kliens beállítása az API kommunikációhoz
const apiClient = axios.create({
  baseURL: 'http://localhost:8680', 
  headers: {
    'Content-Type': 'application/json',
  },
});

/**
 * Felhasználók lekérése.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<Object>} - A felhasználók listája.
 */
export const fetchUsers = async (token) => {
  try {
    const response = await apiClient.get('/user/list', {
      headers: { Authorization: token },
    });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználók lekérésekor:', error);
  }
};

/**
 * Kijelentkezteti a felhasználót és törli a session-t.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<{message: string}>} - A kijelentkezés eredménye.
 */
export const logout = async (token) => {
  sessionStorage.clear();
  try {
    const response = await apiClient.get('/auth/logout', {
      headers: { Authorization: token },
    });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó kileptetésekor:', error);
  }
};

/**
 * Bejelentkezteti a felhasználót a szerverre.
 * @param {string} name - A felhasználónév.
 * @param {string} pass - A jelszó.
 * @returns {Promise<Object>} - A bejelentkezési adatok (token, jogosultságok stb.).
 */
export const login = async (name, pass) => {
  sessionStorage.clear();
  try {
    const response = await apiClient.post('/auth/login', { name: name, password: pass });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó beléptetésekor:', error);
  }
};


/**
 * Új felhasználó létrehozása.
 * @param {string} name - A felhasználónév.
 * @param {string} pass - A jelszó.
 * @param {string} email - Az e-mail cím.
 * @param {Array} permissions - A felhasználó jogosultságai.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<{message: string}>} - A létrehozás eredménye.
 */
export const createUser = async (name, pass, email, permissions, token) => {
  try {
    const response = await apiClient.post('/user/create', { name: name, password: pass, email: email, permissions: permissions}, 
      {headers: { Authorization: token }},
    );
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó létrehozásakor:', error);
  }
};

/**
 * Felhasználó törlése az adatbázisból.
 * @param {number} id - A törlendő felhasználó azonosítója.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<{message: string}>} - A törlés eredménye.
 */
export const deleteUser = async (id, token) => {
  try {
    const response = await apiClient.delete(`/user/delete/${id}`, {
      headers: { Authorization: token }
    });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó törlésekor', error);
  }
};

/**
 * Egy adott felhasználó adatainak lekérése.
 * @param {number} id - A felhasználó azonosítója.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<Object>} - A felhasználó adatai.
 */
export const readUser = async (id, token) => {
  try {
    const response = await apiClient.get(`/user/read/${id}`, {
      headers: { Authorization: token }
    });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó olvasásakor', error);
  }
};

/**
 * Felhasználó adatainak módosítása.
 * @param {number} id - A szerkesztendő felhasználó azonosítója.
 * @param {string} name - Az új felhasználónév.
 * @param {string} pass - Az új jelszó.
 * @param {string} email - Az új e-mail cím.
 * @param {Array} permissions - A frissített jogosultságok.
 * @param {string} token - A hitelesítési token.
 * @returns {Promise<{message: string}>} - A módosítás eredménye.
 */
export const editUser = async (id, name, pass, email, permissions, token) => {
  try {
    const response = await apiClient.put(`/user/update/${id}`, { name: name, password: pass, email: email, permissions: permissions}, 
      {headers: { Authorization: token }},
    );
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó szerkesztésekor:', error);
  }
};
