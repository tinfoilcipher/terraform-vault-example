provider "vault" {
    address         = var.vault_url
    skip_tls_verify = true
    token           = var.vault_token
}
