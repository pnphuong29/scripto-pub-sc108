alias apinitscrapy="ap_func_init_scrapy"
ap_func_init_scrapy() {
    if alias apinitscrapyshare &>/dev/null; then
        apinitscrapyshare
    fi

    if alias apinitscrapycommon &>/dev/null; then
        apinitscrapycommon
    fi
}

alias apcreatedirstructscrapy="ap_func_create_dirstruct_scrapy"
ap_func_create_dirstruct_scrapy() {
    if alias apcreatedirstructscrapyshare &>/dev/null; then
        apcreatedirstructscrapyshare
    fi

    if alias apcreatedirstructscrapycommon &>/dev/null; then
        apcreatedirstructscrapycommon
    fi
}

alias rmdirstructscrapy="ap_func_rm_dirstruct_scrapy"
ap_func_rm_dirstruct_scrapy() {
    if alias rmdirstructscrapyshare &>/dev/null; then
        rmdirstructscrapyshare
    fi

    if alias rmdirstructscrapycommon &>/dev/null; then
        rmdirstructscrapycommon
    fi
}

alias apsetupscrapy="ap_func_setup_scrapy"
ap_func_setup_scrapy() {
    aplogshow "Install [scrapy]\n"
    pip install scrapy

    apinitscrapy
    if alias apcreatedirstructscrapy &>/dev/null; then
        apcreatedirstructscrapy
    fi
}

alias rmscrapy="ap_func_rm_scrapy"
ap_func_rm_scrapy() {
    aplogshow "Remove [scrapy]\n"
    pip uninstall scrapy

    if alias rmdirstructscrapy &>/dev/null; then
        rmdirstructscrapy
    fi

    if alias rmglobalsymlinkscrapy &>/dev/null; then
        rmglobalsymlinkscrapy
    fi
}
