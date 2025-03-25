# AWS Amplify React+Vite Starter Template

> [!NOTE]
> For all other documentation checkout the [official AWS Amplify React+Vite Starter Template](https://github.com/aws-samples/amplify-vite-react-template/blob/76f0a48a22abaa3e1b5a6d8e99a5bc55af35850e/README.md)

## Authenticate `nix` with `GitHub`

Add environment variable ...

```sh
NIX_CONFIG="access-tokens = github.com=$GITHUB_TOKEN"
```

... to your Amplify environment where `$GITHUB_TOKEN` is [your `GitHub` personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)

This allows `nix` to access private `GitHub` repositories.
