'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "28a84781ab92206382bd03c0e33df2ce",
"/": "28a84781ab92206382bd03c0e33df2ce",
"main.dart.js": "1e6c46e0bedbba6fecfb4babfbe134b8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "771cda94fb9701f723c73c071fe9f0e7",
"assets/LICENSE": "8e885ad66d69c34bbd3caa621cac0d25",
"assets/imgs/psxme2.png": "ccd3662cc7be1e812abefc270be03974",
"assets/imgs/psxx.jpg": "d9e1dc064b0bf9a94e18a6a810c01640",
"assets/AssetManifest.json": "6b18070705c0c3261847098eee76200a",
"assets/FontManifest.json": "cdbc85c6a44d1e1869f82a9304f8faa3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/google_fonts/Lato/Lato-Regular.ttf": "2d36b1a925432bae7f3c53a340868c6e",
"assets/google_fonts/Ubuntu/Ubuntu-Regular.ttf": "2505bfbd9bde14a7829cc8c242a0d25c",
"favicon2-min.png": "88e699401c858fe6ce12feb0702b7a3a"
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
