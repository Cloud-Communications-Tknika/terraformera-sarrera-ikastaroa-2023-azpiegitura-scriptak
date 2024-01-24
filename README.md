# Terraform-era sarrera ikastaroa 2023 - Azpiegitura script-a

Aurre balditzak:

- VS Code instalatua izatea
- Terraform CLI-a instalatu izatea: [manuala](https://docs.google.com/presentation/d/1y2q_uZaiG7lDk_L_mHNWWCA-btgrLg2D/edit?amp;ouid=110110235131328442165&amp;rtpof=true&amp;sd=true#slide=id.g29db174ca7b_0_80)

AWS kredentzialak (ez Academy) lortzeko pausoak:

- AWS-ko web interfazean logueatu (erabiltzaile arrunt batekin, ez administratzari orokorrarekin)
- Goi-eskuinean, izenaren gainean klik egin eta "Credenciales de seguridad" atalean sartu
- "Claves de acceso" menuaren barruan, "Crear clave de acceso" botoia sakatu
- "Caso de uso" aukeren arten, "Interfaz de línea de comandos" aukerarekin nahiko izan beharko litzateke
- Prozesua amaitzean ("siguiente"-ri pare bat aldiz emanez), access_key-a eta secret_key-a azaldu beharko lirateke
- terraform.tfvars.default fitxategiaren kopia bat egin "terraform.tfvars" izenarekin eta, bertan, access_key eta secret_key balioak txertatu

Exekuzioa:

```
terraform init
```

```
chmod +x script_*
```

- script_create.sh fitxategian, zenbat makina birtual sortu nahi diren zehaztu (```for i in {1..20}```)

```
./script_create.sh
```

