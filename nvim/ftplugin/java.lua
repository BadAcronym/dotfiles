local config = {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
	init_options = {
		bundles = {
			vim.fn.glob(
				(
					-- vim.fn.stdpath("data")
					-- .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
					"C:/Users/steidl/Appdata/local/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
				),
				1
			),
		},
	},
}
require("jdtls").start_or_attach(config)
