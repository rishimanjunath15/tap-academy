import axios from 'axios';

// Production API URL - Update this with your Vercel backend URL
const API_URL = process.env.REACT_APP_API_URL || 'https://tap-academy-dun.vercel.app/api';

console.log('API URL:', API_URL); // Debug log

const API = axios.create({
  baseURL: API_URL
});

API.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default API;
