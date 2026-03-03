'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2099c2149bf1524cb020e906e9855d1b",
"assets/AssetManifest.bin.json": "6b78fdfa367c2ab9e7a90860d26ac85c",
"assets/AssetManifest.json": "6435235e90960ee3c4f8003de76efc91",
"assets/assets/images/chatbot_shots/auth_shots.png": "75086b8fc25c8a65f17cb1fe9d4b2cee",
"assets/assets/images/chatbot_shots/onboarding_shots.png": "57b17a8ba152b701260acb9a0408b0b4",
"assets/assets/images/chatbot_shots/profile_shots.png": "ea4b866ec9320bced9ebc98d5197a70e",
"assets/assets/images/icon.png": "b1ceb8bcaf87d7dfab3311fe0c52e5bc",
"assets/assets/images/me.jpg": "29a3fd321d246d4648c97c2e328fd157",
"assets/assets/images/mothooq_shots/999shots_so.png": "e41d3fd09612859c2087a17d0e1798d1",
"assets/assets/images/mothooq_shots/apply_order_shots.png": "37029d85cf2d74e5fae57b73db38de20",
"assets/assets/images/mothooq_shots/auth_shots.png": "5cf7fec849a82c36f7f1771673fb3c98",
"assets/assets/images/mothooq_shots/car_details_shots.png": "44f3ea5d4918616f054ddfa02853d919",
"assets/assets/images/mothooq_shots/home_shots.png": "89149eb5ce2b5949d64273f951e1bcee",
"assets/assets/images/mothooq_shots/my_cars_shots.png": "6edc65908f8196051f0d9eea1fbe2c13",
"assets/assets/images/mothooq_shots/sell_car-shots.png": "1b70122f3ca083377b22384e895ad0b0",
"assets/assets/images/mothooq_shots/services_shots.png": "9ceb9dbda6a69badb2d275eb5ea91576",
"assets/assets/images/taskify_shots/add_task_shots.png": "177d5b06876a794e0d6b1996bf1a57f4",
"assets/assets/images/taskify_shots/bottom_bar_shots.png": "4f8672646e94fe0a419f3f0ed16723f5",
"assets/assets/images/taskify_shots/edit_task_shots.png": "2051b622ab83f9b350486b16fd1b694b",
"assets/assets/images/taskify_shots/onboarding_shots.png": "903b884649eb99945dd325e8200595fe",
"assets/assets/images/taskify_shots/shots.png": "2de834332573c80bc692047f71e54209",
"assets/assets/lottie/experience.json": "a48a9a3cc5271ddc29d697abb1354b04",
"assets/assets/lottie/experience2.json": "cfec1d194c440fd5e91f5ef82c581973",
"assets/assets/lottie/experience3.json": "c404c62f02a7b480f03d006c3a4bf45c",
"assets/assets/lottie/laptop.json": "e2fb7cceb83b958050f67500b652cb8b",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "2f1f8936233397792ecd3ee7d2691df6",
"assets/NOTICES": "c3af7a3f884a577e2b8ba34ee96f2be8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f2bbc987927313f7a48279cd00bfd6f1",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "fc46a7fef2994b8d41846effdf0d5cf4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2fc62c863e5f887bf91386346ac3e5a8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "1cbf76d1fdcc7a599335f801a612e5a7",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "b88a7c6a9b3b1e50dd24441c5db1bafd",
"icons/Icon-192.png": "142fd9a04ae1e1594cd1df49dc5c9562",
"icons/Icon-512.png": "be37eaaf9411e878264f800e87390bad",
"icons/Icon-maskable-192.png": "142fd9a04ae1e1594cd1df49dc5c9562",
"icons/Icon-maskable-512.png": "be37eaaf9411e878264f800e87390bad",
"index.html": "df6e3ef4fb573d05273ef65c939f4979",
"/": "df6e3ef4fb573d05273ef65c939f4979",
"main.dart.js": "37f15e9b623ecbc6c8eabaac0bd3f82e",
"manifest.json": "fd8336fda868a270de0bc32b43fafa9b",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
