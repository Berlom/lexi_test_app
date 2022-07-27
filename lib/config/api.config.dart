// ApiConfig class
const Map apiConfig = {
  // Api config for local environment
  // baseUrl: 'http://www.ds-backend.local',
  // baseApi: 'http://www.ds-backend.local/index.php/api/v1',
  // iri: '/index.php/api/v1',
  // Api config for pre-prod environment
  "baseUrl": 'preprod.lexi.tn',
  "baseApi": 'https://www.preprod.lexi.tn/ds_backend/public/api/v1',
  "uri": '/ds_backend/public/api/v1',
  // Api config for prod environment
  // baseUrl: 'https://www.lexi.tn/ds_backend/public',
  // baseApi: 'https://www.lexi.tn/ds_backend/public/api/v1',
  // iri: '/api/v1',
  "userRoles": {
    "admin": 'ROLE_ADMIN',
    "candidate": 'ROLE_CANDIDATE',
    "monitor": 'ROLE_MONITOR'
  },
  // PAYMEE Config for Preprod
  "paymeeUrl": 'https://sandbox.paymee.tn/gateway/',
  // PAYMEE Config for Prod
  // paymeeUrl: 'https://app.paymee.tn/gateway/',
};
