'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "a4ed070bccfa7e416296b58e539d2397",
"/": "a4ed070bccfa7e416296b58e539d2397",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/LICENSE": "1f3f5b3e5b21f902e4828a4490b9a37c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "f7cd94441391aa86d3fbad38578ce0c9",
"manifest.json": "4cc2f2500512c273aabd58607c30246d"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
