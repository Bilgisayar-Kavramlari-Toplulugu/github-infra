# GitHub Configuration
github_organization = "Bilgisayar-Kavramlari-Toplulugu"

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

# Projects Configuration
projects = {

  "DevBoard" = {
    project_display_name = "Projelerini sergile, yeteneklerini göster ve keşfet!"
    project_lead         = "ysfcc"
    team_name            = "DevBoard"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-devboard"
        description        = "DevBoard Project Repo"
        visibility         = "public"
        license            = "mit"
        gitignore_template = "Node"
      }
    ]
    members = [
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "Deadstronaut"
        role     = "maintainer"
      },
      {
        username = "flovearth"
        role     = "member"
      },

    ]
  }

  "OpenTeamManager" = {
    project_display_name = "Ekip yönetimini basitleştir, verimliliği artır!"
    project_lead         = "demirgulsen"
    team_name            = "OpenTeamManager"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-openteammanager-frontend"
        description        = "OpenTeamManager Project Frontend Repo"
        visibility         = "public"
        license            = "mit"
        gitignore_template = "Node"
      },
      {
        name               = "project-openteammanager-backend"
        description        = "OpenTeamManager Project Backend Repo"
        visibility         = "public"
        license            = "mit"
        gitignore_template = "Go"
      },
    ]
    members = [
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "the-forward"
        role     = "member"
      },
      {
        username = "silanaba"
        role     = "member"
      },
      {
        username = "Enisuzunn"
        role     = "member"
      },
      {
        username = "Feyat"
        role     = "member"
      },
      {
        username = "elifsoyleyici"
        role     = "member"
      },
      {
        username = "ysfcc"
        role     = "member"
      },
      {
        username = "umutssl"
        role     = "member"
      },
      {
        username = "dogu-omer"
        role     = "member"
      },
      {
        username = "HumeyraErtas"
        role     = "member"
      },
      {
        username = "Cezik01"
        role     = "member"
      },
      {
        username = "aycabasaran1"
        role     = "member"
      },
      {
        username = "berkcangumusisik"
        role     = "maintainer"
      },
      {
        username = "maliuyanik"
        role     = "member"
      },
      {
        username = "nurrsena"
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
        role     = "maintainer"
      },
      {
        username = "adenercan"
        role     = "maintainer"
      },
      {
        username = "alierenaytar"
        role     = "maintainer"
      },
      {
        username = "gozdeinan"
        role     = "maintainer"
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
      {
        username = "Atillatahak"
        role     = "member"
      },
      {
        username = "yunus54yunus"
        role     = "maintainer"
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
    project_lead         = "tlpkurt"
    team_name            = "skillcard"
    team_permission      = "push"
    repositories = [
      {
        name        = "project-skillcard"
        description = "Skill Card Project Repository"
        visibility  = "public"
        license     = "mit"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "hakanceran64"
        role     = "member"
      },
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "anenthusiastic"
        role     = "member"
      },
      {
        username = "ismailaricioglu"
        role     = "member"
      },
      {
        username = "belmuh"
        role     = "member"
      },
      {
        username = "Shamsiaa"
        role     = "member"
      },
      {
        username = "nehircimen"
        role     = "member"
      },
      {
        username = "altnsksema"
        role     = "member"
      },
      {
        username = "GizzYii"
        role     = "member"
      },
      {
        username = "ayhanarican"
        role     = "member"
      },
      {
        username = "ysfcc"
        role     = "member"
      },
      {
        username = "kubraevren"
        role     = "member"
      },
      {
        username = "Usainsasal"
        role     = "member"
      },
      {
        username = "mrfiratatalay"
        role     = "member"
      },
      {
        username = "CaglaOkmen"
        role     = "member"
      },
      {
        username = "selin-tutuncu"
        role     = "member"
      },
      {
        username = "kemalkilicaslan"
        role     = "member"
      },
      {
        username = "cankayafaruk"
        role     = "member"
      },
      {
        username = "4839490"
        role     = "member"
      },
      {
        username = "Zeycer"
        role     = "member"
      },
      {
        username = "dogu-omer"
        role     = "member"
      },
      {
        username = "emrebostanoglu"
        role     = "member"
      },
      {
        username = "berkcangumusisik"
        role     = "member"
      },
      {
        username = "aycabasaran1"
        role     = "member"
      },
      {
        username = "hakancemG"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
    ]
  }

  "zulip-automation" = {
    project_display_name = "Zulip daily quiz automation"
    project_lead         = "flovearth"
    team_name            = "zulip-automation"
    team_permission      = "push"
    repositories = [
      {
        name        = "zulip-daily-quiz"
        description = "Zulip daily quiz automation"
        visibility  = "public"
        license     = "mit"
        has_wiki    = true
      },
    ]
    members = [
      {
        username = "flovearth"
        role     = "maintainer"
      },
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "Shamsiaa"
        role     = "member"
      },
      {
        username = "lerkush"
        role     = "member"
      },
      {
        username = "ismailaricioglu"
        role     = "member"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      },
    ]
  }
  "LearnOps" = {
    project_display_name = "Cloud and Devops Learning Platform"
    project_lead         = "flovearth"
    team_name            = "LearnOps"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-learnops"
        description        = "Cloud and Devops Learning Platform"
        visibility         = "public"
        license            = "mit"
        gitignore_template = "Python"
      },
    ]
    members = [
      {
        username = "lerkush"
        role     = "maintainer"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      },
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "shamsiaa"
        role     = "member"
      },
      {
        username = "ErtanSidar"
        role     = "member"
      },
      {
        username = "demirgulsen"
        role     = "member"
      },
      {
        username = "belmuh"
        role     = "member"
      },
      {
        username = "ferhatabik"
        role     = "member"
      },
      {
        username = "muhammedcagrikurt"
        role     = "member"
      },
      {
        username = "replakcan"
        role     = "member"
      },
      {
        username = "ismailaricioglu"
        role     = "member"
      }
    ]
  }

  "isbirlikleri" = {
    project_display_name = "Reklam ve Isbirlikleri Ekibi"
    project_lead         = "alierenaytar"
    team_name            = "isbirlikleri"
    team_permission      = "push"
    repositories = [
      {
        name               = "isbirlikleri"
        description        = "Reklam ve Isbirlikleri Ekibi"
        visibility         = "private"
        license            = "mit"
        gitignore_template = "Python"
      },
    ]
    members = [
      {
        username = "gozdeinan"
        role     = "maintainer"
      },
      {
        username = "yunus54yunus"
        role     = "maintainer"
      },
      {
        username = "tubaozyurt2024"
        role     = "member"
      },
      {
        username = "rabiabaykra41"
        role     = "member"
      },
      {
        username = "semanurmetin20"
        role     = "member"
      },
      {
        username = "emrakts"
        role     = "member"
      },
      {
        username = "svenes25"
        role     = "member"
      },
      {
        username = "emresulutas"
        role     = "member"
      },
      {
        username = "ismailaricioglu"
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
    ]
  }

  "localde-calisiyordu" = {
    project_display_name = "localde çalışıyordu Yazılım/Programlama grubu tarafından hazırlanan bültenleri yayınlamak için kullanılan bir statik websitesidir."
    project_lead         = "gecicidegisken"
    team_name            = "localde-calisiyordu"
    team_permission      = "push"
    repositories = [
      {
        name               = "localde-calisiyordu"
        description        = "localde çalışıyordu Yazılım/Programlama grubu tarafından hazırlanan bültenleri yayınlamak için kullanılan bir statik websitesidir."
        visibility         = "public"
        license            = "apache-2.0"
        has_wiki           = true
        gitignore_template = "Ruby"
      },
    ]
    members = [
      {
        username = "gecicidegisken"
        role     = "member"
      },
    ]
  }
  "EWS_UN" = {
    project_display_name = "Early Warning System Project"
    project_lead         = "elifsoyleyici"
    team_name            = "ews-team"
    team_permission      = "push"
    repositories = [
      {
        name               = "project-ews"
        description        = "Open-source platform for multi-source disaster data integration, risk analysis, and location-based early warning alerts."
        visibility         = "public"
        license            = "mit"
        gitignore_template = "Python"
      },
    ]
    members = [
      {
        username = "slymanmrcan"
        role     = "maintainer"
      },
      {
        username = "anenthusiastic"
        role     = "maintainer"
      },
      {
        username = "flovearth"
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
        username = "GamzeNurAslan"
        role     = "member"
      },
      {
        username = "fokusistatistik"
        role     = "member"
      },
      {
        username = "MerveAltnsk"
        role     = "member"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      },
      {
        username = "Deadstronaut"
        role     = "maintainer"
      },
      {
        username = "tlpkurt"
        role     = "member"
      }
    ]
  }
}


