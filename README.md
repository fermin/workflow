# Workflow

可通过页面控制的状态机，状态机用的是 https://github.com/troessner/transitions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'workflow', github: 'fermin/workflow'
```

Install workflow

		$ rails g workflow:install

New migration
	
		$ rails g workflow:migration

		$ rake db:migrate

New views

		$ rails g workflow:views

## Usage

Add this line to model where you want to have workflow

		$ include Workflow::Transition
	
在使用之前，如果你已有字段控制状态，把Model名称及字段名称通过页面/workflow/work_categories配置到数据库即可；如果还没有这个字段，需要你手动的添加字段，然后配置到数据库。

## Contributing

1. Fork it ( https://github.com/[my-github-username]/workflow/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
