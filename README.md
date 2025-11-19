# Terraform ile GitHub Yönetimi Projesi

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-Bilgisayar%20Kavramlari%20Toplulugu-181717?style=flat-square&logo=github)](https://github.com/Bilgisayar-Kavramlari-Toplulugu/github-infra)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

**[Proje ile ilgili detaylı bilgi](docs/Project-Definition.md)**

</div>

---

<details open>
<summary><strong>🇹🇷 Türkçe</strong></summary>

<br>

> **ÖNEMLİ:** Bu repository **GitHub Management via Terraform** projesinin bir parçasıdır. Proje hakkında detaylı bilgi için [Project-Definition](docs/Project-Definition.md) dosyasına bakınız.

## 📖 Hakkında

Bu proje, GitHub organizasyonlarında yeni repoların standartlara uygun ve kolay bir şekilde oluşturulmasını sağlamak amacıyla geliştirilmiştir.

Organizasyonda belirlenen kurallara göre repo açma, yönetme ve kullanıcı işlemlerini otomatikleştirerek büyük kolaylık sunar. Oluşturulan repolara rehber niteliğinde dokümanlar otomatik olarak eklenir.

Bilgisayar Kavramları Topluluğu'nda yeni bir proje başlatmak için bu repodaki [`terraform.tfvars`](terraform.tfvars) dosyasına gerekli bilgileri girmeniz yeterlidir. Gerekli bilgileri eklediğinizde, reponuz otomatik olarak kullanıma hazır hale gelir.

Reponuzu oluşturduktan sonra lütfen oluşturulan dosyaları kendi projenize uygun olarak güncelleyiniz.

## 💻 [`terraform.tfvars`](terraform.tfvars) dosyası Kullanımı


Her proje aşağıdaki yapıda tanımlanır:
```
"project-key" = {
	project_display_name = "..."   // Projenin görünen adı (opsiyonel, insan okunabilir)
	team_name            = "..."   // GitHub'da oluşturulacak takım adı
	project_lead         = "..."   // Proje liderinin GitHub kullanıcı adı
	team_permission      = "push"  // Takım izin seviyesi
	repositories         = [...]    // Proje altındaki repository'ler
	members              = [...]    // Takım üyeleri
}
```
**Notlar:**
- `project-key`: Terraform tarafından kullanılan teknik ve benzersiz anahtar (değişmemeli).
- `project_display_name`: GitHub dokümantasyonunda görünen isim (verilmezse anahtar kullanılır).

**Takım İzin Seviyeleri:**
- `pull`: Sadece okuma yetkisi
- `triage`: Issue/PR düzenleme, kod gönderemez
- `push`: Yazma yetkisi (kod gönderme) ⭐ Önerilen
- `maintain`: Kod yönetimi + issue + PR kontrolü

**Üye Roller:**
- `member`: Normal takım üyesi
- `maintainer`: Takım yöneticisi (ekip yönetim yetkisi)
---

## 🤝 Katkıda Bulunma

Katkıda bulunmak için lütfen [CONTRIBUTING](CONTRIBUTING.md) dosyasını inceleyin.

## 📚 Dokümantasyon

- [Proje Tanımı](docs/Project-Definition.md)
- [Mimari Genel Bakış](docs/Architecture-Overview.md)
- [Geliştirme Akışı](docs/Development-Workflow.md)

## 📄 Lisans

Bu proje MIT Lisansı ile lisanslanmıştır - detaylar için [LICENSE](LICENSE) dosyasına bakın.

---

**Proje Lideri:** [@flovearth](https://github.com/flovearth)

</details>
  
<details>
<summary><strong>🇬🇧 English</strong></summary>

<br>

> **IMPORTANT:** This repository is part of the **GitHub Management via Terraform** project. For detailed information, see the [Project-Definition](docs/Project-Definition.md) file.

## 📖 About

This project is developed to facilitate the creation of new repos in GitHub organizations in accordance with standards and in an easy way.

It provides great convenience by automating repo creation, management, and user operations according to the rules set in the organization. Guide documents are automatically added to the created repos.


To start a new project in Bilgisayar Kavramları Topluluğu, simply enter the required information into the [`terraform.tfvars`](terraform.tfvars) file in this repo. Once you add the necessary information, your repo will be automatically ready for use.

After your repo is created, please update the generated files according to your own project needs.

## 💻 Usage

## 🤝 Contributing

Please see the [CONTRIBUTING](CONTRIBUTING.md) file for contribution guidelines.

## 📚 Documentation

- [Project Definition](docs/Project-Definition.md)
- [Architecture Overview](docs/Architecture-Overview.md)
- [Development Workflow](docs/Development-Workflow.md)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Project Lead:** [@flovearth](https://github.com/flovearth)

</details>