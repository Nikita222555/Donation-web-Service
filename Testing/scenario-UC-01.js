import http from 'k6/http';
import { check, sleep } from 'k6';
import { randomIntBetween } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';

export let options = {
    stages: [
        { duration: '10m', target: 1 },
        { duration: '10m', target: 2 },
        { duration: '10m', target: 3 },
        { duration: '10m', target: 4 },
        // { duration: '1m', target: 5 },
        // { duration: '1m', target: 5 },
    ],
};

// User information -- (if status is true => user locked)
let array = [
    { "name" : "Sukey Cobb", "amount" : 0.50 },
    { "name" : "Charmaine Lansdowne", "amount" : 0.50 },
    { "name" : "Zena Fashion", "amount" : 0.50 },
    { "name" : "Jorie Meriott", "amount" : 0.50 },
    { "name" : "Rochelle Madgett", "amount" : 0.50 },
    { "name" : "Biron Voss", "amount" : 0.50 },
    { "name" : "Julianne Pilbeam", "amount" : 0.50 },
    { "name" : "Leonanie Adam", "amount" : 0.50 },
    { "name" : "Ellerey Colam", "amount" : 0.50 },
    { "name" : "Karylin Wenzel", "amount" : 0.50 },
    { "name" : "Brion Pipping", "amount" : 0.50 },
    { "name" : "Reina Bocke", "amount" : 0.50 },
    { "name" : "Lyndel Ennals", "amount" : 0.50 },
];

export default function () {
    const rps = __VU * 0.5;
    //let num = Math.floor(Math.random() * array.length);
    let num = randomIntBetween(0, 12);
    const requestBody = JSON.stringify(array[num]);

    const params = {
        headers: { 'Content-Type': 'application/json', },
    };

    const res = http.post('http://localhost:8080/api/v1/open', requestBody, params);
    
    // add check status 200
    check(res, { 'REQUEST IS STATUS --- 200': (r) => r.status === 200, });
    
    console.log('RESPONSE STATUS: ',res.status,' RES.BODY: ', res.body);

    //sleep(1/rps - res.timings.duration);
    sleep( randomIntBetween(2, 3) );
};