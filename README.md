# Car Master Hub - SAP RAP

[![SAP BTP](https://img.shields.io/badge/SAP-BTP-blue?style=flat-square)](https://www.sap.com)
[![ABAP Cloud](https://img.shields.io/badge/ABAP-Cloud-black?style=flat-square)](https://keywords.sap.com)
[![OData V4](https://img.shields.io/badge/OData-V4-orange?style=flat-square)](https://www.odata.org)
[![Framework](https://img.shields.io/badge/RAP-Managed__with__draft-green?style=flat-square)]()

---

## 🚀 Key Features

* **Automated External REST API Integration:** The system features a dedicated ABAP HTTP client that queries an external microservice (NHTSA vPIC) upon VIN entry. It asynchronously parses the JSON response to automatically populate vehicle details (make, model, production year).
* **Full Draft Handling Support (Managed):** The implementation of the `with draft` mechanism allows for seamless, conflict-free editing and temporary form state saving. This prevents immediate database locking and ensures no data is lost if the session is interrupted.
* **RAP Business Actions:** Built-in native operations that modify entity states in real-time (e.g., a quick car reservation/purchase action directly from the customer view).
* **Persona-Based UI Architecture:** Independent CDS data projections tailored specifically for Dealer and Customer roles, all driven by a single core business data model.

---

## 🛠️ Tech Stack

* **Backend:** ABAP Cloud, Clean ABAP, Object-Oriented ABAP (OO ABAP).
* **Data Modeling:** ABAP Core Data Services (CDS View Entities, Projection Views, Metadata Extensions).
* **Communication Protocol:** OData V4 (Metadata-Driven UI, performance optimization via associations, and *Lazy Loading* for Value Helps).
* **External Connectivity:** HTTP Client (`cl_web_http_client`), JSON Deserialization (`/ui2/cl_json`).
* **Frontend:** SAP Fiori Elements (List Report & Object Page) driven entirely by backend annotations.

---

## 📂 Project Structure

The project comprises the following core architectural artifacts:

* `ZR_CAR_MASTER` - Base Entity View (Data Definition) defining the data model and dictionary associations.
* `ZC_CAR_MASTER` / `ZC_CAR_CUSTOMER` — CDS Projection Views tailored to specific user roles.
* `ZR_CAR_MASTER` (Behavior Definition) — Defines business behaviors, CRUD operations, draft handling, and the `decodeVin` action.
* `ZBP_R_CAR_MASTER` - Behavior Pool implementation class containing the business logic for actions and the HTTP GET network integration with the API.
* `ZUI_CAR_MASTER` / `ZSB_CAR_MASTER` — Service Definition & Service Binding exposing the service using the OData V4 standard.
