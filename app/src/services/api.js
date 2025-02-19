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

export const editUser = async (id, name, pass, email, permissions, token) => {
  try {
    const response = await apiClient.put(`/user/update/${id}`, { name: name, password: pass, email: email, permissions: permissions}, 
      {headers: { Authorization: token }},
    );
    return response.data;
  } catch (error) {
    throw new Error('Hiba a felhasználó létrehozásakor:', error);
  }
};
