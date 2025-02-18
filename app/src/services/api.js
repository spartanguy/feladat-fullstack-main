import axios from 'axios';
const apiClient = axios.create({
  baseURL: 'http://localhost:8680', 
  headers: {
    'Content-Type': 'application/json',
  },
});

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

export const logout = async (token) => {
  localStorage.removeItem('authToken');
  try {
    const response = await apiClient.get('/auth/logout', {
      headers: { Authorization: token },
    });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó kileptetésekor:', error);
  }
};

export const login = async (name, pass) => {
  try {
    const response = await apiClient.post('/auth/login', { name: name, password: pass });
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó beléptetésekor:', error);
  }
};
