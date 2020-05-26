resource "random_password" "azuresecrets" {
    length = 32
    special = true
    count   = "${length(var.secret_keys)}"
}

resource "vault_generic_secret" "azuresecrets" {
    path      = "secret/kvstore/"
    count     = "${length(var.secret_keys)}"
    data_json = <<EOT
    {
    "${var.secret_keys[count.index]}": "${random_password.azuresecrets.*.result[count.index]}"
    }
    EOT
}
