'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "00b1bf420a5828e1d041c0d3c37ac7cd",
"/": "00b1bf420a5828e1d041c0d3c37ac7cd",
"main.dart.js": "a67aa74a84bafc36b48a65139267f45e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "771cda94fb9701f723c73c071fe9f0e7",
"assets/LICENSE": "68f14b63437262f2d906095a5cdbad25",
"assets/imgs/psxme.png": "7dcb824ef46e04cbd8b5a77bc8e0bbd4",
"assets/imgs/psxme2.png": "677a5b710cb71e0e873d07250ea5d4ff",
"assets/imgs/psx.jpg": "3e15ce67327007d64fc76614d7f3c06f",
"assets/imgs/psx.png": "5081f234906e019481af7b5fe34016e1",
"assets/AssetManifest.json": "e1ecc0e4c7c6529e128792c8e31b02bf",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
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
