return {
    {
        "rmagatti/auto-session",
        event = "VimEnter",
        opts = {
            auto_save_enabled = true,
            auto_restore_enabled = false,
            auto_session_suppress_dirs = {
                "~/",
                "~/Downloads",
                "/",
            },
            session_lens = {
                load_on_setup = true,
            },
        },
    },
}
