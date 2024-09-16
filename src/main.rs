use clap::Parser;

use anyhow::{Context, Result};

use enigo::{Enigo, Keyboard, Settings};

/// Simple CLI tool to put text with wayland protocol
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(value_name = "STRING", index = 1)]
    string: String,
}

fn main() -> Result<()> {
    env_logger::init();

    let args = Args::parse();

    let mut enigo = Enigo::new(&Settings::default()).context("Unable to connect to the backend")?;

    enigo.text(&args.string).context("Unable to send text")?;

    Ok(())
}
