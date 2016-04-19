Traits.build do
  model(:lonestar) do
    attribute(:title, 'Lonestar College')
  end
end

Traits.build do
  model(:texas_tech) do
    attribute(:title, 'Texas Tech')
  end
end

Traits.build do
  model(:math_department) do
    attribute(:title, 'Mathematics')
    attribute(:abbreviation, 'MATH')
  end
end

Traits.build do
  model(:english_department) do
    attribute(:title, 'English')
    attribute(:abbreviation, 'ENGL')
  end
end

Traits.build do
  model(:algebra) do
    attribute(:title, 'College Algebra')
    attribute(:code, 1314)
    attribute(:credits, 3)
  end
end

Traits.build do
  model(:trigonometry) do
    attribute(:title, 'College Algebra')
    attribute(:code, 1316)
    attribute(:credits, 3)
  end
end
