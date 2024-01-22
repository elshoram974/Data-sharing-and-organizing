
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

const firebaseConfig = {
    apiKey: "AIzaSyAWukpW5wlRlQA-JA2pRdbi6Vmx_jcwIRk",
    authDomain: "data-shring-and-organizing.firebaseapp.com",
    projectId: "data-shring-and-organizing",
    storageBucket: "data-shring-and-organizing.appspot.com",
    messagingSenderId: "466899267669",
    appId: "1:466899267669:web:6fc4b1b3284f1eac51a4dc",
    measurementId: "G-XNY97DBJYH"
};

firebase.initializeApp(firebaseConfig);

// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
});