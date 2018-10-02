10.times do |blog|
	Blog.create!(
		title: "My Blog post #{blog}",
		body: "Sed ut perspiciatis unde 
		omnis iste natus error sit voluptatem 
		accusantium doloremque laudantium, 
		totam rem aperiam, eaque ipsa quae ab 
		illo inventore veritatis et quasi 
		architecto beatae vitae dicta sunt 
		explicabo. Nemo enim ipsam voluptatem 
		quia voluptas sit aspernatur aut odit aut 
		ugit, sed quia consequuntur magni dolores 
		eos qui ratione voluptatem sequi nesciunt. 
		Neque porro quisquam est, qui dolorem ipsum 
		quia dolor sit amet, consectetur, adipisci 
		velit, sed quia non numquam eius modi tempora 
		incidunt ut labore et dolore magnam aliquam 
		quaerat voluptatem. Ut enim ad minima veniam, 
		quis nostrum exercitationem ullam corporis 
		suscipit laboriosam, nisi ut aliquid ex ea 
		commodi consequatur? Quis autem vel eum iure 
		reprehenderit qui in ea voluptate velit esse 
		quam nihil molestiae consequatur, vel illum 
		qui dolorem eum fugiat quo voluptas nulla 
		pariatur?"
		)
end
puts "10 blog posts created"

5.times do |skills| 
	Skill.create!(
		titulo: "Rails #{skills}",
		porcentaje_utilizado: 15
		)
end
puts "5 skills created"

5.times do |portfolio_item| 
	Portfolio.create!(
		titulo: "Portfolio title: #{portfolio_item}",
		subtitulo: "My great service",
		cuerpo: "La flor es la estructura reproductiva 
		característica de las plantas llamadas 
		espermatofitas o fanerógamas. La función de una 
		flor es producir semillas a través de la 
		reproducción sexual. Para las plantas, 
		las semillas son la próxima generación, 
		y sirven como el principal medio a través del 
		cual las especies se perpetúan y se propagan.",
		main_imagen: "https://via.placeholder.com/600x400",
		thumb_imagen: "https://via.placeholder.com/350x200"
		)
end
puts "9 portfolios items created"