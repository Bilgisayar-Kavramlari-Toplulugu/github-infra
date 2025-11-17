# GitHub Configuration
github_organization = "Bilgisayar-Kavramlari-Toplulugu"

#=============================================================================
# PROJE YAPISININ AÇIKLAMASI
#=============================================================================
# Bu dosyada her proje şu yapıda tanımlanır:
# 
# "project-key" = {                # Proje benzersiz anahtarı (UNIQUE, değişmez)
#   project_display_name = "..."   # Proje görünen adı (opsiyonel, insan okunabilir)
#   team_name            = "..."   # GitHub'da oluşturulacak takım adı
#   project_lead         = "..."   # Proje lideri GitHub kullanıcı adı
#   team_permission      = "push"  # Takım izin seviyesi
#   repositories         = [...]   # Proje altındaki repository'ler
#   members              = [...]   # Takım üyeleri
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
  # ========================================
  # PROJE: Infrastructure as Code Ornek
  # ========================================
  # "InfraCoders" = {
  #   project_display_name = "GitHub Management via Terraform"
  #   project_lead         = "flovearth"
  #   team_name            = "InfraCoders"
  #   team_permission      = "push"
  #   repositories = [
  #     {
  #       name        = "project-terraform-github"
  #       description = "Terraform ile GitHub Repolarının Otomatik Yönetimi"
  #       visibility  = "public"
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
    project_display_name = "Loop Projesi"
    project_lead         = "hakanceran64"
    team_name            = "Loop-Team"
    team_permission      = "push"
    repositories = [
      {
        name        = "project-loop-web-app"
        description = "Web app for Project Loop"
        visibility  = "public"
      },
      {
        name        = "project-loop-mobile-app"
        description = "Mobile app for Project Loop"
        visibility  = "public"
      },
    ]
    members = [
      {
        username = "flovearth"
        role     = "maintainer"
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



}


