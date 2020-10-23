function fn() {
    var yaloStagingUrl = 'https://api-staging2.yalochat.com/notifications/api/v1';
    var authorizationToken = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhalZ4SUQ1MFZnZjNEWkc0aTR5RkRyWWNETmYycmRHQyJ9.oqDnOoDOzmO12B5oEOSzX0F8K_FUBUhrm0HVvNBuKpQ';

    var config = {
        baseUrl: karate.properties['base.url'] || yaloStagingUrl,
        authorizationToken: karate.properties['authorization.token'] || authorizationToken,
    }

    return config;
}
