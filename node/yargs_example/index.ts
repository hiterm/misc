import yargs from "yargs/yargs";
import { hideBin } from "yargs/helpers";

yargs(hideBin(process.argv))
  .command(
    "serve <arg1> [port]",
    "start the server",
    (yargs) => {
      return yargs
        .positional("port", {
          describe: "port to bind on",
          default: 5000,
        })
        .positional("arg1", {
          describe: "port to bind on",
          type: "number",
        });
    },
    (argv) => {
      if (argv.verbose) console.info(`start server on :${argv.port}`);
      console.log(argv.port);
      console.log(argv.arg1);
    }
  )
  .command(
    "$0 <arg2>",
    "description",
    (yargs) => {
      return yargs
        .positional("arg2", {
          type: "number",
        })
        .demandOption(["arg2"]);
    },
    (argv) => {
      console.log(argv.arg2);
    }
  )
  .command(
    "command3 <arg3>",
    "description",
    (yargs) => {
      return yargs
        .positional("arg3", {
          type: "string",
          demandOption: true,
        })
        .demandOption(["arg3"]);
    },
    (argv) => {
      console.log(argv.arg3);
    }
  )
  .parse();
