# Flask Transportation Schedule

Este proyecto está construido utilizando **Flask** como servidor web y **Peewee** como ORM para la interacción con la base de datos. 

## Propósito del Programa

La finalidad de mi API es ofrecer una forma sencilla y centralizada de obtener información clara sobre rutas de transporte público. Cuando un cliente, ya sea una aplicación web o un programa de escritorio, consulta la API, recibe un objeto JSON que describe un viaje específico: qué ruta es, qué tipo de transporte usa, cuánto cuesta, a qué hora se aborda, si está disponible y cuáles son los puntos importantes que recorre.

Esta API está destinada a proporcionar un objeto JSON correspondiente al modelo **Viaje**, y este modelo encapsula la siguiente información:

- **Número de ruta** del bus o microbús.  
- **Tipo de transporte** (bus o microbús).  
- **Precio del viaje**.  
- **Hora de abordaje**.  
- **Disponibilidad** de la ruta (si está disponible o no).  
- **Puntos importantes** por los que pasa dicho transporte.

## Clientes Destinatarios

Esta API está diseñada para ser consumida por:

- Un **cliente web**.  
- Un **cliente de escritorio nativo**.

## Despliegue

1. Primero, clonamos el repositorio con todo el proyecto y utilizamos el siguiente comando:

```sh
 git clone https://github.com/eg-2022/flask-transport-schedule-api.git
```

2. Luego, ejecutaremos el siguiente comando para construir la imagen de nuestro contenedor de Docker:

```sh
docker build -t flask-transport-schedule-img .
```

3. Verificamos que exista la imagen con:

```sh
docker image ls
```

4. Después de verificar que se haya construido la imagen en nuestro servidor, procedemos a ejecutar el contenedor con:

```sh
docker run -d --name api_test -p 8080:8080 flask-transport-schedule-img
```

> [!NOTE]
> La API se debe estar ejecutando en el puerto 8080, de no ejecutarse con éxito, tratar de desocupar ese puerto.


5. Hacer pruebas de la API con los siguientes comandos:

```sh
curl -X GET http://localhost:8080/

curl -X GET http://localhost:8080/3
```

Deberá de lucir de la siguiente manera los dos resultados:

```sh
$ curl -X GET http://localhost:8080/
[
  {
    "boardingStops": [
      "Paseo General",
      "Salvador del Mundo"
    ],
    "boardingTime": [
      "5:00",
      "8:00",
      "12:00"
    ],
    "id": "1",
    "isAvailable": true,
    "price": 0.2,
    "route": "1",
    "transportType": "bus"
  },
  {
    "boardingStops": [
      "Paseo General",
      "Centro Hist\u00f3rico",
      "Metrocentro",
      "Metrosur"
    ],
    "boardingTime": [
      "5:00",
      "8:00",
      "12:00"
    ],
    "id": "2",
    "isAvailable": true,
    "price": 0.25,
    "route": "2-A",
    "transportType": "microbus"
  },
  {
    "boardingStops": [
      "Santa Elena",
      "Centro Hist\u00f3rico",
      "Metrocentro",
      "Metrosur"
    ],
    "boardingTime": [
      "5:00",
      "8:00",
      "12:00"
    ],
    "id": "3",
    "isAvailable": true,
    "price": 0.25,
    "route": "2-B",
    "transportType": "microbus"
  },
  {
    "boardingStops": [],
    "boardingTime": [],
    "id": "4",
    "isAvailable": false,
    "price": 0.25,
    "route": "2-C",
    "transportType": "microbus"
  }
]
```

```sh
$ curl -X GET http://localhost:8080/3
[
  {
    "boardingStops": [
      "Santa Elena",
      "Centro Hist\u00f3rico",
      "Metrocentro",
      "Metrosur"
    ],
    "boardingTime": [
      "5:00",
      "8:00",
      "12:00"
    ],
    "id": "3",
    "isAvailable": true,
    "price": 0.25,
    "route": "2-B",
    "transportType": "microbus"
  }
]
```