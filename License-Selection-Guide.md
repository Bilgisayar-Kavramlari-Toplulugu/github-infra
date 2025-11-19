# License Selection Guide / Lisans Seçim Rehberi


<details open>
<summary><h2>🇹🇷 Türkçe</h2></summary>

### Genel Bakış
Bu Terraform yapılandırması ile repository oluştururken lisanslama üzerinde tam kontrole sahipsiniz. Sistem, belirttiğiniz kriterlere göre lisans dosyasını otomatik olarak oluşturur.

### Nasıl Çalışır?

#### Varsayılan Davranış
Eğer bir lisans belirtmezseniz veya boş bırakırsanız (`""`), otomatik olarak **MIT Lisansı** repository'nize eklenecektir.

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    # Lisans belirtilmemiş - varsayılan olarak MIT kullanılacak
  },
  {
    name        = "diger-proje"
    description = "Diğer proje"
    visibility  = "public"
    license     = ""  # Boş lisans - varsayılan olarak MIT kullanılacak
  }
]
```

#### Lisans Belirtme
Farklı bir lisans kullanmak için, geçerli bir lisans tanımlayıcısı ile `license` alanını ekleyin:

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    license     = "apache-2.0"  # Apache License 2.0 kullanılacak
  }
]
```

#### Lisanssız
Repository'nizde hiçbir lisans dosyası istemiyorsanız, `"none"` değerini kullanın:

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    license     = "none"  # LICENSE dosyası oluşturulmayacak
  }
]
```

### Geçerli Lisans Tanımlayıcıları

GitHub tarafından desteklenen lisans tanımlayıcıları:

| Lisans Adı | Tanımlayıcı | Açıklama |
|------------|-------------|----------|
| MIT Lisansı | `mit` | Basit ve izin verici |
| Apache Lisansı 2.0 | `apache-2.0` | Patent hakları ile izin verici |
| GNU GPLv3 | `gpl-3.0` | Güçlü copyleft |
| GNU AGPLv3 | `agpl-3.0` | Ağ copyleft'i |
| GNU LGPLv3 | `lgpl-3.0` | Zayıf copyleft |
| Mozilla Public License 2.0 | `mpl-2.0` | Zayıf copyleft |
| BSD 2-Clause "Basitleştirilmiş" | `bsd-2-clause` | Basit izin verici |
| BSD 3-Clause "Yeni" veya "Revize" | `bsd-3-clause` | Kısıtlamalarla izin verici |
| Boost Yazılım Lisansı 1.0 | `bsl-1.0` | Basit izin verici |
| Creative Commons Zero v1.0 | `cc0-1.0` | Kamu malı |
| Eclipse Public License 2.0 | `epl-2.0` | Zayıf copyleft |
| GNU GPLv2 | `gpl-2.0` | Güçlü copyleft |
| ISC Lisansı | `isc` | Basit izin verici |
| The Unlicense | `unlicense` | Kamu malı |

### Doğrulama

Sistem aşağıdaki kontrolleri içerir:
- Lisans tanımlayıcıları küçük harf olmalıdır
- Sadece geçerli GitHub lisans tanımlayıcıları kabul edilir
- Özel `"none"` değeri lisanssız durumlar için tanınır

Geçersiz bir lisans tanımlayıcısı girerseniz, Terraform herhangi bir kaynak oluşturmadan önce doğrulama aşamasında hata gösterecektir.

### Örnekler

**Örnek 1: Varsayılan MIT lisansı kullanımı**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        # MIT lisansı otomatik olarak kullanılacak
      }
    ]
    members = [...]
  }
}
```

**Örnek 2: Apache 2.0 lisansı kullanımı**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        license     = "apache-2.0"
      }
    ]
    members = [...]
  }
}
```

**Örnek 3: Lisanssız**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "dahili-arac"
        description = "Dahili araç"
        visibility  = "private"
        license     = "none"
      }
    ]
    members = [...]
  }
}
```

---

## Quick Reference / Hızlı Referans

| Scenario / Senaryo | Configuration / Yapılandırma | Result / Sonuç |
|---------------------|------------------------------|----------------|
| No license field / Lisans alanı yok | `{}` | MIT license / MIT lisansı |
| Empty license / Boş lisans | `license = ""` | MIT license / MIT lisansı |
| Explicit MIT / Açık MIT | `license = "mit"` | MIT license / MIT lisansı |
| Apache 2.0 | `license = "apache-2.0"` | Apache 2.0 license / Apache 2.0 lisansı |
| No license wanted / Lisans istemiyorum | `license = "none"` | No LICENSE file / LICENSE dosyası yok |

---

## Support / Destek

For more information about licenses, visit:
Lisanslar hakkında daha fazla bilgi için:

- **English**: https://choosealicense.com/
- **Türkçe**: https://choosealicense.com/

For GitHub license documentation:
GitHub lisans dokümantasyonu için:

- https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository

</details>

<details>
<summary><h3>🇬🇧 Click for English</h3></summary>

### Overview
When creating repositories through this Terraform configuration, you have full control over licensing. The system automatically handles license file creation based on your specification.

### How It Works

#### Default Behavior
If you don't specify a license or leave it empty (`""`), **MIT License** will be automatically added to your repository.

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    # No license specified - MIT will be used by default
  },
  {
    name        = "another-project"
    description = "Another project"
    visibility  = "public"
    license     = ""  # Empty license - MIT will be used by default
  }
]
```

#### Specifying a License
To use a different license, add the `license` field with a valid license identifier:

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    license     = "apache-2.0"  # Apache License 2.0 will be used
  }
]
```

#### No License
If you don't want any license file in your repository, use `"none"`:

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    license     = "none"  # No LICENSE file will be created
  }
]
```

### Valid License Identifiers

The following license identifiers are supported by GitHub:

| License Name | Identifier | Description |
|--------------|------------|-------------|
| MIT License | `mit` | Simple and permissive |
| Apache License 2.0 | `apache-2.0` | Permissive with patent grant |
| GNU GPLv3 | `gpl-3.0` | Strong copyleft |
| GNU AGPLv3 | `agpl-3.0` | Network copyleft |
| GNU LGPLv3 | `lgpl-3.0` | Weak copyleft |
| Mozilla Public License 2.0 | `mpl-2.0` | Weak copyleft |
| BSD 2-Clause "Simplified" | `bsd-2-clause` | Simple permissive |
| BSD 3-Clause "New" or "Revised" | `bsd-3-clause` | Permissive with restrictions |
| Boost Software License 1.0 | `bsl-1.0` | Simple permissive |
| Creative Commons Zero v1.0 | `cc0-1.0` | Public domain dedication |
| Eclipse Public License 2.0 | `epl-2.0` | Weak copyleft |
| GNU GPLv2 | `gpl-2.0` | Strong copyleft |
| ISC License | `isc` | Simple permissive |
| The Unlicense | `unlicense` | Public domain |

### Validation

The system includes validation to ensure:
- License identifiers are lowercase
- Only valid GitHub license identifiers are accepted
- Special value `"none"` is recognized for no license

If you enter an invalid license identifier, Terraform will show an error during the validation phase before creating any resources.

### Examples

**Example 1: Using default MIT license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-app"
        description = "Frontend application"
        visibility  = "public"
        # MIT license will be used automatically
      }
    ]
    members = [...]
  }
}
```

**Example 2: Using Apache 2.0 license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-app"
        description = "Frontend application"
        visibility  = "public"
        license     = "apache-2.0"
      }
    ]
    members = [...]
  }
}
```

**Example 3: No license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "internal-tool"
        description = "Internal tool"
        visibility  = "private"
        license     = "none"
      }
    ]
    members = [...]
  }
}
```

---
</details>

