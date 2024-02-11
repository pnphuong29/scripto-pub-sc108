alias @initprisma="ap_func_init_prisma"
ap_func_init_prisma() {
    alias prisma='npx prisma'
    alias prismaversion='npx prisma version'
    alias prismastudio='npx prisma studio'
    alias prismainit='npx prisma init'
    alias prismagenerate='npx prisma generate'
    alias prismastudio='npx prisma studio'
    alias prismavalidate='npx prisma validate'
    alias prismadebug='npx prisma debug'
    alias prismaformat='npx prisma format'

    alias prismadb='npx prisma db'
    alias prismadbexec='npx prisma db execute'
    alias prismadbseed='npx prisma db seed'
    alias prismadbpull='npx prisma db pull'
    alias prismadbpush='npx prisma db push'

    alias prismamigrate='npx prisma migrate'
    alias prismamigratereset='npx prisma migrate reset'
    alias prismamigrateresetskipseed='npx prisma migrate reset --skip-seed'
    alias prismamigrateresetskipgenerate='npx prisma migrate reset --skip-generate'
    alias prismamigratedev='npx prisma migrate dev'
    alias prismamigratedevcreateonly='npx prisma migrate dev --create-only'
    alias prismamigratedevskipseed='npx prisma migrate dev --skip-seed'
    alias prismamigratedevskipgenerate='npx prisma migrate dev --skip-generate'
    alias prismamigratediff='npx prisma migrate diff'
    alias prismamigratestatus='npx prisma migrate status'
    alias prismamigrateresolve='npx prisma migrate resolve'
    alias prismamigrateresolveapplied='npx prisma migrate resolve --applied'
    alias prismamigrateresolverollbacked='npx prisma migrate resolve --rolled-back'

    if alias @initprismashare &>/dev/null; then
        @initprismashare
    fi

    if alias @initprismacommon &>/dev/null; then
        @initprismacommon
    fi
}

alias @createdirstructprisma="ap_func_create_dirstruct_prisma"
ap_func_create_dirstruct_prisma() {
    if alias @createdirstructprismashare &>/dev/null; then
        @createdirstructprismashare
    fi

    if alias @createdirstructprismacommon &>/dev/null; then
        @createdirstructprismacommon
    fi
}

alias @rmdirstructprisma="ap_func_rm_dirstruct_prisma"
ap_func_rm_dirstruct_prisma() {
    if alias @rmdirstructprismashare &>/dev/null; then
        @rmdirstructprismashare
    fi

    if alias @rmdirstructprismacommon &>/dev/null; then
        @rmdirstructprismacommon
    fi
}

alias @setupprisma="ap_func_setup_prisma"
ap_func_setup_prisma() {
    @logshow "Install [prisma]\n"
    npm install prisma

    @initprisma
    if alias @createdirstructprisma &>/dev/null; then
        @createdirstructprisma
    fi
}

alias @rmprisma="ap_func_rm_prisma"
ap_func_rm_prisma() {
    @logshow "Remove [prisma]\n"
    npm uninstall -g prisma

    if alias @rmdirstructprisma &>/dev/null; then
        @rmdirstructprisma
    fi

    if alias @rmglobalsymlinkprisma &>/dev/null; then
        @rmglobalsymlinkprisma
    fi
}

alias prismamigratediffurl="ap_func_prisma_migrate_diff_url"
ap_func_prisma_migrate_diff_url() {
    npx prisma migrate diff --from-url "${1}" --to-url "${2}" --script
}

alias prismamigratediffmigration="ap_func_prisma_migrate_diff_migration"
ap_func_prisma_migrate_diff_migration() {
    npx prisma migrate diff --from-migrations "${1}" --to-migrations "${2}" --script
}

alias prismamigratediffschemadatamodel="ap_func_prisma_migrate_diff_schema_datamodel"
ap_func_prisma_migrate_diff_schema_datamodel() {
    npx prisma migrate diff --from-schema-datamodel "${1}" --to-schema-datamodel "${2}" --script
}

alias prismamigratebaseline="ap_func_prisma_migrate_diff_baseline"
ap_func_prisma_migrate_diff_baseline() {
    local ap_schema="${PWD}/prisma/schema.prisma"
    [ -n "${1}" ] && ap_schema="${1}"
    npx prisma migrate diff --from-empty --to-schema-datamodel "${ap_schema}" --script
}
