# [Auralis NLP](https://auralis.netlify.app)

Auralis is an open API service that applies natural language processing (NLP) and semantic analysis to open source repositories across multiple ecosystems.

It is built on top of [Ecosyste.ms: Repos](https://repos.ecosyste.ms), an open dataset and API for exploring open source metadata. Auralis enhances this metadata with deeper insights into repository intent, documentation quality, community signals, and more.

## API

API documentation is available at: [https://auralis.tools/docs](https://auralis.tools/docs)

The underlying metadata is powered by the [Ecosyste.ms Repos API](https://repos.ecosyste.ms/docs), with additional NLP layers processed and served by Auralis.

Default usage is limited to **5000 requests per hour per IP**. Contact us if you need higher limits.

## Development

For setup and deployment instructions, see [DEVELOPMENT.md](DEVELOPMENT.md).  
This includes how to run the Auralis NLP pipeline locally, configure environment variables, and connect to the upstream metadata API.

## Contribute

We welcome contributions! The source code is hosted on [GitHub](https://github.com/auralis-nlp/auralis).  
To get involved, [open an issue](https://github.com/auralis-nlp/auralis/issues/new) or submit a pull request.

If you're looking for a place to start, check out the ["Help Wanted"](https://github.com/auralis-nlp/auralis/issues?q=is%3Aopen+label%3A%22help+wanted%22) issues.

You can also help by triaging — this includes confirming bug reports, improving issue descriptions, or requesting reproduction steps when missing.

Auralis is an open-source project. Frequent contributors may be invited to join as maintainers.

Follow our progress on Twitter: [@auralis_nlp](https://twitter.com/auralis_nlp)

### Note on Patches / Pull Requests

- Fork the project
- Implement your feature or bug fix
- Include test coverage if applicable
- Open a pull request (topic branches encouraged!)

### Vulnerability Disclosure

We encourage responsible security research. Please refer to our [vulnerability disclosure policy](https://github.com/auralis-nlp/auralis/security/policy).

### Code of Conduct

Participation in this project is subject to our [Code of Conduct](https://github.com/auralis-nlp/.github/blob/main/CODE_OF_CONDUCT.md).

## Copyright

Code is licensed under the [GNU AGPL-3.0 License](LICENSE) © 2025 [The Auralis Project](https://github.com/auralis-nlp).

Underlying metadata is sourced from [Ecosyste.ms](https://repos.ecosyste.ms) and is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
