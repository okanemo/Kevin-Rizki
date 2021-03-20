# README

## Introduction

This projects provide:
* Single endpoint that accepts two specific external API payloads and save into database.

## How to use
1. Clone this repo
2. Install PostgreSQL in case you don't have it
3. Run `./bootstrap.sh` with the name of your project like `./bootstrap.sh awesome_laboratories`
4. `rails s`
5. You can now try your REST services.

## Usage

### PatientLab
**Create PatientLab [api/patient_labs]**

**Create [POST]**

* Request Ok (Case_1)
  * Body
    ```
    { 
        "date_of_test":"20210227134300", 
        "id_number": "IC000A0",
        "patient_name":"Patient A4", 
        "gender":"F", 
        "date_of_birth":"19940231", 
        "lab_number":"QT196-21-124", 
        "clinic_code":"QT196", 
        "lab_studies":[
            {
            "code":"2085-9", 
            "name":"HDL Cholesterol", 
            "value":"cancel", 
            "unit":"mg/dL", 
            "ref_range":"> 59", 
            "finding":"A", 
            "result_state":"F"
            } 
        ]
    }
    ```
* Request Ok (Case_2)
  * Body
    ```
    { 
        "patient_data":
        {
            "id_number":"IC000A10", 
            "first_name":"Patient", 
            "last_name":"A5", 
            "phone_mobile":"+6500000000",
            "gender":"M", 
            "date_of_birth":"19940231"
        }, 
        "date_of_test":"20210227134300", 
        "lab_number":"QT196-21-124", 
        "clinic_code":"QT196", 
        "lab_studies":[
        {
            "code":"2085-9", 
            "name":"HDL Cholesterol", 
            "value":"cancel", 
            "unit":"mg/dL", 
            "ref_range":"> 59", 
            "finding":"A", 
            "result_state":"F"
        } 
        ]
    }
    ```
* Response 201 ()
  * Body 
    ```
    {
        "id": 7,
        "id_number": "IC000A10",
        "patient_name": "Patient A5",
        "phone_mobile": "+6500000000",
        "gender": "M",
        "date_of_birth": "19940231",
        "date_of_test": "20210227134300",
        "lab_number": "QT196-21-124",
        "clinic_code": "QT196",
        "code": "2085-9",
        "name": "HDL Cholesterol",
        "value": "cancel",
        "unit": "mg/dL",
        "ref_range": "> 59",
        "finding": "A",
        "result_state": "F",
        "created_at": "2021-03-20T20:37:34.414Z",
        "updated_at": "2021-03-20T20:37:34.414Z"
    }
    ```

* Request Not Acceptable
  * Body
    ```
    {
        "date_of_test":"20210227134300", 
        "lab_number":"QT196-21-124", 
        "clinic_code":"QT196", 
        "lab_studies":[
            {
            "code":"2085-9", 
            "name":"HDL Cholesterol", 
            "value":"cancel", 
            "unit":"mg/dL", 
            "ref_range":"> 59", 
            "finding":"A", 
            "result_state":"F"
            } 
        ]
    }
    ```
* Response 406 ()
  * Body
    ```
    {
        "errors": [
            "Id number can't be blank",
            "Id number already exists",
            "Patient name can't be blank",
            "Gender can't be blank",
            "Date of birth can't be blank"
        ]
    }
    ```

* Request Conflict
  * Body
    ```
    { 
        "date_of_test":"20210227134300", 
        "id_number": "IC000A0",
        "patient_name":"Patient A4", 
        "gender":"F", 
        "date_of_birth":"19940231", 
        "lab_number":"QT196-21-124", 
        "clinic_code":"QT196", 
        "lab_studies":[
            {
            "code":"2085-9", 
            "name":"HDL Cholesterol", 
            "value":"cancel", 
            "unit":"mg/dL", 
            "ref_range":"> 59", 
            "finding":"A", 
            "result_state":"F"
            } 
        ]
    }
    ```
  * Response 409 ()
    ```
    {
        "errors": [
            "Id number already exists"
        ]
    }
    ```



## Use Case Examples

**Create a new patient lab using case_1 format**
```console
$ curl -X POST -H 'Content-type: application/json' -d ' { 
    "date_of_test":"20210227134300", 
    "id_number":"IC000A2", 
    "patient_name":"Patient A4", 
    "gender":"F", 
    "date_of_birth":"19940231", 
    "lab_number":"QT196-21-124", 
    "clinic_code":"QT196", 
    "lab_studies":[
        {
        "code":"2085-9", 
        "name":"HDL Cholesterol", 
        "value":"cancel", 
        "unit":"mg/dL", 
        "ref_range":"> 59", 
        "finding":"A", 
        "result_state":"F"
        } 
    ]
 }' localhost:3000/api/patient_labs
```

**Create a new patient lab using case_2 format**
```console
$ curl -X POST -H 'Content-type: application/json' -d '{ 
    "patient_data":
    {
        "id_number":"IC000A3", 
        "first_name":"Patient", 
        "last_name":"A5", 
        "phone_mobile":"+6500000000",
        "gender":"M", 
        "date_of_birth":"19940231"
    }, 
    "date_of_test":"20210227134300", 
    "lab_number":"QT196-21-124", 
    "clinic_code":"QT196", 
    "lab_studies":[
    {
        "code":"2085-9", 
        "name":"HDL Cholesterol", 
        "value":"cancel", 
        "unit":"mg/dL", 
        "ref_range":"> 59", 
        "finding":"A", 
        "result_state":"F"
    } 
  ]
 }' localhost:3000/api/patient_labs
```