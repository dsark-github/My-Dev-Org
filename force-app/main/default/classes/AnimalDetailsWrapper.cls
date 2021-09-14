public class AnimalDetailsWrapper {

	public Animal animal;

	public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}

	
	public static AnimalDetailsWrapper parse(String json) {
		return (AnimalDetailsWrapper) System.JSON.deserialize(json, AnimalDetailsWrapper.class);
	}
}