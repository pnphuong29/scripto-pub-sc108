alias @initscrapy="ap_func_init_scrapy"
ap_func_init_scrapy() {
    if alias @initscrapyshare &>/dev/null; then
        @initscrapyshare
    fi

    if alias @initscrapycommon &>/dev/null; then
        @initscrapycommon
    fi
}

alias @createdirstructscrapy="ap_func_create_dirstruct_scrapy"
ap_func_create_dirstruct_scrapy() {
    if alias @createdirstructscrapyshare &>/dev/null; then
        @createdirstructscrapyshare
    fi

    if alias @createdirstructscrapycommon &>/dev/null; then
        @createdirstructscrapycommon
    fi
}

alias @rmdirstructscrapy="ap_func_rm_dirstruct_scrapy"
ap_func_rm_dirstruct_scrapy() {
    if alias @rmdirstructscrapyshare &>/dev/null; then
        @rmdirstructscrapyshare
    fi

    if alias @rmdirstructscrapycommon &>/dev/null; then
        @rmdirstructscrapycommon
    fi
}

alias @setupscrapy="ap_func_setup_scrapy"
ap_func_setup_scrapy() {
    @logshow "Install [scrapy]\n"
    pip install scrapy

    @initscrapy
    if alias @createdirstructscrapy &>/dev/null; then
        @createdirstructscrapy
    fi
}

alias @rmscrapy="ap_func_rm_scrapy"
ap_func_rm_scrapy() {
    @logshow "Remove [scrapy]\n"
    pip uninstall scrapy

    if alias @rmdirstructscrapy &>/dev/null; then
        @rmdirstructscrapy
    fi

    if alias @rmglobalsymlinkscrapy &>/dev/null; then
        @rmglobalsymlinkscrapy
    fi
}
