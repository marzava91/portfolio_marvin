'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "14a5a586292951faf1af3a352095125f",
"assets/AssetManifest.bin.json": "6db94b76a59151a3a654c1a4aad34100",
"assets/AssetManifest.json": "f8f5a886b0b847ec4b14c2483556016c",
"assets/assets/docs/Marvin_Zavaleta_Fullstack_Developer_EN.pdf": "82e754795a591bc9937fb20ace0f2b73",
"assets/assets/docs/Marvin_Zavaleta_Fullstack_Developer_ES.pdf": "602a4e9877e9361ced304d3d9b2ac233",
"assets/assets/images/blob_ash.png": "f76b87a8dd8bb4ad017b441854541a2b",
"assets/assets/images/blob_bean_ash.png": "bc902ac538eedf1abc48457bbf064fd1",
"assets/assets/images/blob_black.png": "14198d608b7f0980998d329cd353e290",
"assets/assets/images/blob_drumstick_black.png": "381f70d9f8dd4fbbb720214fa02939a2",
"assets/assets/images/blob_femur_ash.png": "636e9560c379a101e2b00e828495b95c",
"assets/assets/images/blob_small_bean_ash.png": "411605e065607a48e110cedc91bebd82",
"assets/assets/images/blog_01.jpg": "cd78990246f63c4d64ca5c26bcf31289",
"assets/assets/images/blog_02.jpg": "01c4b84663980a0b4f55f4bd196492bd",
"assets/assets/images/blog_03.jpg": "5f88a99b651c6dbad988d684c6fc41b3",
"assets/assets/images/box_cover_dark.png": "34f90bdba46732221c608605016c40d5",
"assets/assets/images/box_cover_gold.png": "342c0da9bf207a33da78ea5fe1d4d56e",
"assets/assets/images/dev_aboutme.png": "d44c92555fe9fc4eb6608325c0323a21",
"assets/assets/images/dev_award.png": "68de4271ee3b7f2c6d2c6fedcc49ea90",
"assets/assets/images/dev_header.png": "d1285fd6d1e255dc32e19cd48977aae1",
"assets/assets/images/dots_globe_grey.png": "bb16bba932c2e98f3dbe3e6b1b6a864b",
"assets/assets/images/dots_globe_yellow.png": "915f014f8ed7e146237b6fd803dac276",
"assets/assets/images/dots_globe_yellow2.png": "0490fb59e6068c0464b2d2c622e2d80a",
"assets/assets/images/ghana_flag.png": "b0afee866ab3333560a0072c5d53bce2",
"assets/assets/images/hi_there.png": "1ac6f5101b6a5511f4ad8f8965a49f89",
"assets/assets/images/icon_box.jpg": "7a18b9b091db5fe0fc16c76a3ffd5db2",
"assets/assets/images/icon_dark.png": "b7834fe38200318f432d609b3eba602e",
"assets/assets/images/icon_light.png": "e3f740686d3105979551402c9a8b07fc",
"assets/assets/images/logo_dark.png": "9cfc8a844bca7ff2b5b9f1339c92ebf0",
"assets/assets/images/logo_light.png": "030618c29ff02639e60a1aa539e19782",
"assets/assets/images/portfolio_01.jpg": "407ce2897522446dd02e67febb5a61cc",
"assets/assets/images/portfolio_01.png": "f1abc79df2c163bf55495a58d4e96b37",
"assets/assets/images/portfolio_02.jpg": "e596828e9de370c2d238d5f1ddb2bf7b",
"assets/assets/images/portfolio_02.png": "6f3d61b98e1dc43bcad534e2e701098d",
"assets/assets/images/portfolio_03.jpg": "2877de17197fefd9ea53a0a893592955",
"assets/assets/images/portfolio_03.png": "ac4ce72ff50791dec445e3f4a5933a6b",
"assets/assets/images/portfolio_04.jpg": "1eaf1fbf9f4ee6bf7ad7abca7a329cb2",
"assets/assets/images/portfolio_04.png": "2ff5e98d4c442d761964d469cb840a7a",
"assets/assets/images/portfolio_05.jpg": "1395d778e88123b33156bc7f09e9a905",
"assets/assets/images/portfolio_05.png": "54ea34821f49db68488adb442c367794",
"assets/assets/images/portfolio_06.jpg": "015d9a88eeaa1a0f5e39b81d32e1bf87",
"assets/assets/translations/en.json": "3e026bc67bcf6e4f6a3a2197569933ed",
"assets/assets/translations/es.json": "ea9a9d403e6cba2243e282273f9f1a48",
"assets/FontManifest.json": "cab905cb3aac16cd8f8b52a8d504c382",
"assets/fonts/MaterialIcons-Regular.otf": "f34cb178ceb5d5c47ac4b30f1946f587",
"assets/NOTICES": "e33fa8b902a7416cc42d97ef1d81f033",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/feather_icons/fonts/feather.ttf": "0d0d92d310cc68e53796bf15c36838c2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "afe633ad5aaa95f5961ae246d067efb2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "8310fedb9a91820079d90317b6a74725",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "eda07f2ec6043e3986305617402cc0bb",
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
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "54d9fb9d5253b068afa2762718a65c12",
"icons/logo.png": "6d6eb82230e94e0061f274019b020770",
"index.html": "cb7d0e1b7f3b17e3bd7c3f8c94c635c4",
"/": "cb7d0e1b7f3b17e3bd7c3f8c94c635c4",
"main.dart.js": "1a792404f1085fe21a423637a5c214e2",
"manifest.json": "9e3e20167f57450978f0c93c5c9de007",
"version.json": "e5c3a2e7c6ad8ca9d4b1da1be392d211"};
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
