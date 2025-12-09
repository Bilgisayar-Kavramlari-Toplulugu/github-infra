# GitHub Configuration
github_organization = "Bilgisayar-Kavramlari-Toplulugu"

# Projects Configuration
projects = {
  # ========================================
  # ÖRNEK PROJE: Infrastructure as Code 
  # ========================================
  # "InfraCoders" = {
  #   project_display_name = "GitHub Management via Terraform"
  #   project_lead         = "flovearth"
  #   team_name            = "InfraCoders"
  #   team_permission      = "push"
  #   repositories = [
  #     {
  #       name               = "project-terraform-github"
  #       description        = "Terraform ile GitHub Repolarının Otomatik Yönetimi"
  #       visibility         = "public"
  #       license            = "mit"
  #       gitignore_template = "Terraform"
  #     },

  #   ]
  #   members = [
  #     {
  #       username = "barisbutun"
  #       role     = "member"
  #     },
  #     {
  #       username = "hakanceran64"
  #       role     = "member"
  #     },
  #     {
  #       username = "hulyaoner"
  #       role     = "member"
  #     },
  #     {
  #       username = "ismailaricioglu"
  #       role     = "member"
  #     },
  #     {
  #       username = "karalarmehmet"
  #       role     = "member"
  #     },
  #     {
  #       username = "kheif"
  #       role     = "member"
  #     },
  #     {
  #       username = "purfatih"
  #       role     = "member"
  #     },
  #     {
  #       username = "seyid12"
  #       role     = "member"
  #     },
  #     {
  #       username = "Shamsiaa"
  #       role     = "member"
  #     },
  #     {
  #       username = "slymanmrcan"
  #       role     = "member"
  #     },
  #     {
  #       username = "lerkush"
  #       role     = "member"
  #     }
  #   ]
  # }

  "Loop" = {
    project_display_name = "Geliştirici Odaklı İşbirliği Platformu Projesi"
    project_lead         = "hakanceran64"
    team_name            = "Loop"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-loop"
        description        = "Loop Projesi Reposu"
        visibility         = "public"
        license            = "mit"
        gitignore_template = "C++"
      },
    ]
    members = [
      {
        username = "flovearth"
        role     = "member"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },


    ]
  }

  "management" = {
    project_display_name = "Yönetim Paneli"
    project_lead         = "hakanceran64"
    team_name            = "management"
    team_permission      = "push"
    repositories = [
      {
        name        = "management"
        description = "Yönetim Paneli Projesi Reposu"
        visibility  = "private"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "halil-ibrahim-demir"
        role     = "member"
      },
      {
        username = "adenercan"
        role     = "member"
      },
      {
        username = "alierenaytar"
        role     = "member"
      },
      {
        username = "gozdeinan"
        role     = "member"
      },
      {
        username = "gecicidegisken"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "BilgisayarKavramlari"
        role     = "member"
      },
      {
        username = "SafakSahinn"
        role     = "member"
      },
      {
        username = "YaseminDenizOzturk"
        role     = "member"
      },
      {
        username = "alperenkbd"
        role     = "member"
      },
      {
        username = "BerattCelikk"
        role     = "member"
      },
      {
        username = "tlpkurt"
        role     = "member"
      },
      {
        username = "burakoner"
        role     = "member"
      },


    ]
  }

  "platform" = {
    project_display_name = "BKT Platform"
    project_lead         = "flovearth" # Your username
    team_name            = "platform"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-platform"
        description        = "This Repo creates and manages BKT Platform"
        visibility         = "public"
        license            = "apache-2.0"
        gitignore_template = "Terraform"
      }
    ]
    members = [
      {
        username = "flovearth" # Your username
        role     = "maintainer"
      }
    ]
  }

  "SkillCard" = {
    project_display_name = "Otomatik olarak Profil Kartı oluşturma projesi"
    project_lead         = "hakanceran64"
    team_name            = "skillcard"
    team_permission      = "push"
    repositories = [
      {
        name        = "project-skillcard"
        description = "Skill Card Projesi Reposu"
        visibility  = "public"
        license     = "mit"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "belmuh"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
    ]
  }
  "FindMyWay" = {
    project_display_name = "FindMyWay yapay zekâ destekli kişisel kariyer ve yaşam planlama platformudur."
    project_lead         = "flovearth"
    team_name            = "FindMyWay"
    team_permission      = "push"
    repositories = [
      {
        name        = "project-FindMyWay"
        description = "FindMyWay yapay zekâ destekli kişisel kariyer ve yaşam planlama platformudur."
        visibility  = "public"
        license     = "apache-2.0"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "flovearth"
        role     = "member"
      },
      {
        username = "MustafaKocamann"
        role     = "member"
      },
      {
        username = "Shamsiaa"
        role     = "member"
      },
      {
        username = "Eness3734"
        role     = "member"
      },
      {
        username = "belmuh"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "demirgulsen"
        role     = "member"
      },
      {
        username = "fatmatosunytu"
        role     = "member"
      },
      {
        username = "Sekolas"
        role     = "member"
      },
      {
        username = "GizzYii"
        role     = "member"
      },



    ]
  }
  "AfetErkenUyari" = {
    project_display_name = "Afet Erken Uyari Sistemi"
    project_lead         = "elifsoyleyici"
    team_name            = "skillcard"
    team_permission      = "push"
    repositories = [
      {
        name        = "project-AfetErenUyari"
        description = "Afet Erken Uyari Sistemi Projesi Reposu"
        visibility  = "public"
        license     = "mit"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "anenthusiastic"
        role     = "member"
      },      
      {
        username = "hakanceran64"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "flovearth"
        role     = "member"
      },
      {
        username = "GizzYii"
        role     = "member"
      },
      {
        username = "myr2001"
        role     = "member"
      },
    ]
  }

}

#=============================================================================
# PROJE YAPISININ AÇIKLAMASI
#=============================================================================
# Bu dosyada her proje şu yapıda tanımlanır:
# 
# "project-key" = {                                  # Proje benzersiz anahtarı (UNIQUE, değişmez)
#   project_display_name = "..."                     # Proje görünen adı (opsiyonel, insan okunabilir)
#   team_name            = "..."                     # GitHub'da oluşturulacak takım adı
#   project_lead         = "..."                     # Proje lideri GitHub kullanıcı adı
#   team_permission      = "push"                    # Takım izin seviyesi
#   repositories         = [...]                     # Proje altındaki repository'ler
#       name             = "project-loop-mobile-app"      # Repo adı
#       description      = "Mobile app for Project Loop"  # Repo açıklaması
#       visibility       = "public"                       # Repo görünürlüğü "public" veya "private"
#       license          = "apache-2.0"                   # Detaylar için License-Selection-Guide.md dosyasına bakınız. Default: "mit"
#       gitignore_template = "Node"                  # GitHub'ın sunduğu .gitignore şablonlarından biri. Default: "Dotnet" Örnek: Android, Angular, C++, Dart, Dotniet, Flutter, Go, Java, Kotlin, Lua, MAven, Nextjs, Objective-C, Perl, PHP, Python, Ruby, Rust, Swift, Terraform, Unity gibi.
#   members              = [...]                     # Takım üyeleri
#       username = "karalarmehmet"                   # github username
#       role     = "member"                          # member veya maintainer
# }
#
# NOT: 
#   - project-key: Terraform'un kullandığı teknik ID (unique olmalı)
#   - project_display_name: GitHub dokümantasyonunda görünen isim (verilmezse key kullanılır)
#
# TEAM PERMISSION SEVİYELERİ:
#   - "pull"     → Sadece okuma yetkisi
#   - "triage"   → Issue/PR düzenleme, kod gönderemez
#   - "push"     → Yazma yetkisi (kod gönderme) ⭐ Önerilen
#   - "maintain" → Kod yönetimi + issue + PR kontrolü
#
# MEMBER ROLE'LERİ:
#   - "member"     → Normal takım üyesi
#   - "maintainer" → Takım yöneticisi (ekip yönetim yetkisi)
#=============================================================================
