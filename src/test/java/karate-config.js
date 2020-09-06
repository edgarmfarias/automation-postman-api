function fn() {
    var postmanApiBaseUrl = 'https://api.getpostman.com';
    var apiKey = 'PMAK-5f52fd632c04f10037ea4f22-b993c24ccb1007ffa1fee7769e2342b982';

    var config = {
        baseUrl: karate.properties['base.url'] || postmanApiBaseUrl,
        apiKey: karate.properties['api.key'] || apiKey,
    }

    return config;
}
