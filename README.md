# ☁️ Cloud Engineering in 90 Days: Complete Portfolio & Study Guide

> A 100% hands-on, production-grade Cloud & DevOps Engineering curriculum built entirely on an **Android phone (Termux)** connected to a **1GB RAM AWS EC2 t3.micro** instance.

[![GitHub Stars](https://img.shields.io/github/stars/gandlarakeshfinn/cloud-engineering-90-days?style=social)](https://github.com/gandlarakeshfinn/cloud-engineering-90-days)
[![Last Commit](https://img.shields.io/github/last-commit/gandlarakeshfinn/cloud-engineering-90-days)](https://github.com/gandlarakeshfinn/cloud-engineering-90-days/commits/master)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![AWS EC2](https://img.shields.io/badge/AWS-EC2_t3.micro-FF9900?logo=amazon-aws)](https://aws.amazon.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-K3s-326CE5?logo=kubernetes)](https://k3s.io/)
[![Helm 3](https://img.shields.io/badge/Helm-v3.12-0F1689?logo=helm)](https://helm.sh/)

---

## 📌 Project Overview

**Cloud Engineering in 90 Days** is a complete, battle-tested curriculum designed to take a learner from Linux command-line basics to advanced Kubernetes orchestration, Helm packaging, RBAC security, and SRE cluster auditing.

### 💡 Why This Repository Is Unique
- **Zero-Laptop Constraints**: Executed entirely from a mobile device using **Termux (SSH)** linked to an **AWS EC2 t3.micro** instance.
- **Resource-Constrained Engineering**: Engineered to run production-grade Kubernetes workloads within **1GB RAM + 1GB Swap file** limits.
- **100% Hands-On**: Every directory contains real manifests (`.yaml`), executable shell scripts (`.sh`), and verified log outputs.
- **Zero Tutorial Hell**: Every concept is immediately followed by terminal execution, failure debugging, and Git commits.

---

## 🏗️ Architecture & Infrastructure Setup

```text
┌───────────────────────────────────────────────────────────┐
│                    Android Device                         │
│               (Termux App via SSH Client)                  │
└─────────────────────────────┬─────────────────────────────┘
                              │
                              │ SSH Key Auth (Port 22 over 4G/5G)
                              ▼
┌───────────────────────────────────────────────────────────┐
│              AWS EC2 Instance (t3.micro)                  │
│       Ubuntu 22.04 LTS | 1 GB RAM + 1 GB Swap File        │
│                                                           │
│  ┌─────────────────────────────────────────────────────┐  │
│  │                  K3s Control Plane                  │  │
│  │                                                     │  │
│  │   • Containerd Runtime   • Flannel CNI Network     │  │
│  │   • CoreDNS              • Local-Path Provisioner  │  │
│  └──────────────────────────┬──────────────────────────┘  │
│                             │                             │
│  ┌──────────────────────────┴──────────────────────────┐  │
│  │                   Cluster Workloads                 │  │
│  │                                                     │  │
│  │   • Docker Containers    • ConfigMaps & Secrets     │  │
│  │   • Deployments & HPA    • StatefulSets & PVCs      │  │
│  │   • Helm 3 Releases      • RBAC Roles & Bindings    │  │
│  │   • DaemonSets & Jobs    • Taints & Affinities      │  │
│  └─────────────────────────────────────────────────────┘  │
└───────────────────────────────────────────────────────────┘


📅 The 90-Day Curriculum Breakdown

🔹 Phase 1: Foundations & Infrastructure (Days 1 – 51)
Week 1 (Days 1–7): Linux System Administration, Bash navigation, permissions, process management, and SSH setup.
Week 2 (Days 8–14): AWS Core Services (EC2 instance launching, Security Groups, Elastic IPs, IAM policies).
Week 3 (Days 15–21): Cloud Networking (VPCs, Public/Private Subnets, Internet Gateways, Route Tables).
Week 4 (Days 22–28): Advanced Shell Scripting (Log parsers, automated backups, system metric monitors, cron jobs).
Week 5 (Days 29–35): Version Control with Git & GitHub (Branching strategies, Merge Conflict resolution, PAT authentication).
Week 6 (Days 36–51): Containerization Basics (Docker Engine, image pulling, container lifecycle management, port mapping).


🔹 Phase 2: Advanced Containerization (Days 52 – 58)
Day 52: Container Networking & Port Forwarding (docker run -p 8080:80).
Day 53: Environment Variables & 12-Factor App configuration injection.
Day 54: Docker Named Volumes & Data Persistence.
Day 55: Multi-Stage Docker Builds (Reducing image footprints from 300MB to 10MB using Alpine/Go stages).
Day 56: Multi-Container Stacks using Docker Compose (docker-compose.yml).
Day 57: Security Hardening: Non-root container user creation.
Day 58: Security Auditing with CIS Docker Bench framework.


🔹 Phase 3: Kubernetes Core Architecture (Days 59 – 70)
Day 59: Kubernetes Control Plane & Worker Node Architecture.
Day 60: K3s Lightweight Cluster Installation & kubeconfig management on 1GB RAM.
Day 61: Imperative & Declarative Pod creation (kubectl apply -f pod.yaml).
Day 62: Pod Lifecycle States, Event Stream Auditing, and Container Debugging.
Day 63: Declarative Deployments, ReplicaSets, and Self-Healing workloads.
Day 64: Zero-Downtime Rolling Updates and Immediate Rollbacks.
Day 65: ClusterIP Services & Internal Service-to-Service DNS Resolution.
Day 66: NodePort Services & External Traffic Ingress Routing.
Day 67: Application Decoupling via ConfigMaps.
Day 68: Encrypted Configuration Storage using Kubernetes Secrets.
Day 69: Imperative CLI Code Generation vs Declarative GitOps.
Day 70: Virtual Multi-Tenancy using Namespaces (dev / prod).


🔹 Phase 4: Workload Optimization & Advanced Storage (Days 71 – 80)
Day 71: Compute Resource Guarantees & Limits (requests/limits).
Day 72: Namespace Governance using ResourceQuotas.
Day 73: Container Deadlock Recovery using Liveness Probes.
Day 74: Traffic Readiness Filtering using Readiness Probes.
Day 75: Dynamic Pod Autoscaling with Horizontal Pod Autoscaler (HPA).
Day 76: Persistent Storage via PV & PVC.
Day 77: Stateful Workloads & Headless Services using StatefulSets.
Day 78: Node-Level System Agents using DaemonSets.
Day 79: Automated Batch Workloads using Jobs and Scheduled CronJobs.
Day 80: Security Governance & Least Privilege Access using RBAC.


🔹 Phase 5: Helm Packaging & Advanced Scheduling (Days 81 – 90)
Day 81: Helm 3 Package Manager Setup & Chart Repositories.
Day 82: Custom Helm Chart Construction (Chart.yaml, values.yaml).
Day 83: Advanced Helm Templating & Named Helpers (_helpers.tpl).
Day 84: Environment-Specific Parameter Overrides (values-dev.yaml).
Day 85: Release Management: Helm Upgrades, Hooks, and Rollbacks.
Day 86: Sequential Container Initialization via Init Containers.
Day 87: Node Repulsion & Pod Tolerations using Taints.
Day 88: Target Hardware Placement using Node Affinity.
Day 89: High Availability Spreading using Pod Anti-Affinity.
Day 90 (Capstone): Automated Cluster Security & Health Audit Scripting.


🧰 Technology Stack
Domain	Technologies Mastered
Cloud Provider	Amazon Web Services (AWS EC2, VPC, IAM)
OS	Ubuntu 22.04 LTS, Debian (Termux)
Containers	Docker, Docker Compose
Orchestration	Kubernetes (K3s), Helm 3
Networking	Flannel CNI, ClusterIP, NodePort, DNS
Monitoring	Metrics Server, Custom Audit Scripts


💼 Industry Roles & Market Expectations (India)
Role	Target Experience	Estimated Salary Range (India)
Associate Cloud Engineer	Fresher / 0–2 Years	₹6.0 LPA – ₹10.0 LPA
DevOps / Infrastructure Engineer	2–4 Years	₹10.0 LPA – ₹18.0 LPA
Associate SRE	2–4 Years	₹12.0 LPA – ₹20.0 LPA
Kubernetes Platform Engineer	3+ Years	₹15.0 LPA – ₹25.0+ LPA


💖 Support The Project / Crypto Donations
If this curriculum helped you learn Cloud Engineering, consider supporting the maintainer!

Bitcoin (BTC):
16hWSRqG7HqU3KZqkTV47z1fKR9vXvWJvL

Ethereum (ETH / ERC-20):
0x48c83daf91bc739e7b55a479106af700079e7352

👤 Author & Socials
Maintainer: Rakesh Gandla
GitHub: @gandlarakeshfinn

📜 License
This project is licensed under the MIT License.`
